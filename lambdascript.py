import json
import boto3
def handler(event, context):
    s3_obj =boto3.client('s3',aws_access_key_id="AKIASW2BROLCV6KN22UA",aws_secret_access_key="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") #creating object for accessing s3

    s3_pet_obj = s3_obj.get_object(Bucket='newbucket-lambda-2021', Key='Petinfo.json')
    s3__pet_data = s3_pet_obj['Body'].read().decode('utf-8')


    s3_pet_list=json.loads(s3__pet_data)
    print("json loaded data")
    

    lo_pet_dict=next(item for item in s3_pet_list['pets'] if item["name"] == event["PetName"])
    

    return lo_pet_dict.get('favFoods')