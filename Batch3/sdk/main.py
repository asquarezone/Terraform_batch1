import boto3


def get_client():
    """This method returns client of dynamo db
    """
    client = boto3.client('dynamodb')
    return client

def get_all_tables(client):
    """This method returns all the tables in dynamo db
    """
    return client.list_tables()

def create_users_table(client):
    """This method creates user table in dynamo db
    """
    # create a Table for storing user data
    client.create_table(
        TableName='Users',
        KeySchema=[
            {
                'AttributeName': 'username',
                'KeyType': 'HASH'
            }
        ],
        AttributeDefinitions=[
            {
                'AttributeName': 'username',
                'AttributeType': 'S'
            }
        ],
        ProvisionedThroughput={
            'ReadCapacityUnits': 1,
            'WriteCapacityUnits': 1
        }
    )


def insert_random_records(client):
    """This method inserts random records in dynamo db
    """
    # insert random records in Users table
    client.put_item(
        TableName='Users',
        Item={
            'username': {'S': 'john'},
            'password': {'S': 'password123'}
        }
    )

    client.put_item(
        TableName='Users',
        Item={
            'username': {'S': 'mary'},
            'password': {'S': 'password456'}
        }
    )

def get_user(username, client):
    """This method returns user data from dynamo db
    """
    return client.get_item(
        TableName='Users',
        Key={
            'username': {'S': username}
        }
    )


if __name__ == "__main__":
    client = get_client()
    tables = get_all_tables(client)
    if 'Users' not in tables['TableNames']:
        create_users_table(client)
        insert_random_records(client)

    user = get_user('john', client)
    print(user['Item'])