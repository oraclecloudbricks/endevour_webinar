import io
import os
import json
import sys

from oci.object_storage.models import bucket
from fdk import response

import oci.object_storage


#Using API: https://oracle-cloud-infrastructure-python-sdk.readthedocs.io/en/latest/api/object_storage/models/oci.object_storage.models.CreateBucketDetails.html#oci.object_storage.models.CreateBucketDetails

def handler(ctx, data: io.BytesIO=None):
    try:
        body = json.loads(data.getvalue())
        bucket_name = body["bucket_name"]
        compartment_ocid = body["compartment_ocid"]        
    except Exception:
        raise Exception('Input a JSON object in the format: \'{"bucket_name": "<bucket name>", "compartment_ocid": "<compartment_ocid>"}\' ')
        
    resp = create_new_bucket(bucket_name, compartment_ocid)

    return response.Response(
        ctx,
        response_data=json.dumps(resp),
        headers={"Content-Type": "application/json"}
    )

def create_new_bucket(bucket_name, compartment_ocid ):
    try:
        signer = oci.auth.signers.get_resource_principals_signer()
        client = oci.object_storage.ObjectStorageClient(config={}, signer=signer)
        namespace = client.get_namespace().data
        print("Creating bucket " + bucket_name+ " in Compartment: "+compartment_ocid, file=sys.stdout)
        client.create_bucket(namespace, oci.object_storage.models.CreateBucketDetails(compartment_id=compartment_ocid, name=bucket_name))
        response = { "Bucket " + bucket_name + " Successfully created under Compartment OCID: "+compartment_ocid : "OK" }
    except Exception as e:
        response = {"An exception has ocurred "+str(e): "FAULT"}           
    return response