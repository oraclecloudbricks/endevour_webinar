import io
import os
import json
import sys

from oci.object_storage.models import bucket
from fdk import response

import oci.object_storage


#Using API: https://oracle-cloud-infrastructure-python-sdk.readthedocs.io/en/latest/api/objhttps://oracle-cloud-infrastructure-python-sdk.readthedocs.io/en/latest/api/object_storage/client/oci.object_storage.ObjectStorageClient.html#oci.object_storage.ObjectStorageClient

def handler(ctx, data: io.BytesIO=None):
    try:
        body = json.loads(data.getvalue())
        bucket_name = body["bucket_name"]           
    except Exception:
        raise Exception('Input a JSON object in the format: \'{"bucket_name": "<bucket name>"}\' ')
        
    resp = delete_bucket(bucket_name)

    return response.Response(
        ctx,
        response_data=json.dumps(resp),
        headers={"Content-Type": "application/json"}
    )

def delete_bucket(bucket_name ):
    try:
        signer = oci.auth.signers.get_resource_principals_signer()
        client = oci.object_storage.ObjectStorageClient(config={}, signer=signer)
        namespace = client.get_namespace().data
        print("Deleting bucket " + bucket_name, file=sys.stdout)       
        client.delete_bucket(namespace, bucket_name)

        response = { "Bucket " + bucket_name + " Successfully deleted" : "OK" }
    except Exception as e:
        response = {"An exception has ocurred "+str(e): "FAULT"}           
    return response