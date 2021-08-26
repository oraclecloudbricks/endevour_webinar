import io
import os
import json
import sys
from fdk import response

import oci.object_storage

def handler(ctx, data: io.BytesIO=None):
    try:
        body = json.loads(data.getvalue())
        bucket_name = body["bucket_name"]
    except Exception:
        raise Exception('Input a JSON object in the format: \'{"bucket_name": "<bucket name>"}\' ')
        
    resp = list_objects(bucket_name)

    return response.Response(
        ctx,
        response_data=json.dumps(resp),
        headers={"Content-Type": "application/json"}
    )

def list_objects(bucket_name):
    try:
        signer = oci.auth.signers.get_resource_principals_signer()
        client = oci.object_storage.ObjectStorageClient(config={}, signer=signer)
        namespace = client.get_namespace().data
        print("Searching for objects in bucket " + bucket_name, file=sys.stderr)
        object = client.list_objects(namespace, bucket_name)
        print("found objects", flush=True)
        objects = [b.name for b in object.data.objects]
        response = { "Objects found in bucket '" + bucket_name + "'": objects }
    except Exception as e:
        response = {"An exception has ocurred "+str(e): "FAULT"}           
    return response
    