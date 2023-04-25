'''
This main.py file defines the backend REST API for my Flutter Project. It includes functionalities for
Creating a Profile, Editing a Profile, and Viewing a Profile.
Also, it implements the Login and Friends Functionality.
'''

from flask import Flask, make_response, request, jsonify
import firebase_admin
from firebase_admin import credentials, firestore, credentials
from flask_cors import CORS

#initialize Flask app
app = Flask(__name__)

# Initialize Firestore DB
cred = credentials.Certificate('key.json')
firebase_admin.initialize_app(cred)
db = firestore.client()
url_prefix = '/api/v1'
CORS(app)

'''
Create Profile Page/Section
This should allow a user to submit their student ID number, name, email, date of birth,
year group, major, whether or not they have campus residence, their best food, and their best movie.

'''
@app.route(url_prefix + '/profiles', methods=['POST', 'OPTIONS'])
def create_profile():
    if request.method == 'OPTIONS':
        response = make_response()
        response.headers.add('Access-Control-Allow-Origin', '*')
        response.headers.add('Access-Control-Allow-Methods', 'POST')
        response.headers.add('Access-Control-Allow-Headers', 'Content-Type')
        return response

    profile_data = request.json
    if not profile_data:
        return jsonify({'error': 'No data provided'}), 400
    
    # Check if all required fields are present
    required_fields = ['name', 'email', 'student_id', 'year_group', 'major', 'dob', 'campus residency', 'best food', 'best movie']
    
    for field in required_fields:
        if field not in profile_data:
            return jsonify({'error': f'Missing required field: {field}'}), 400
    
    # Create a new document in Firestore
    profile_ref = db.collection('profiles')
    profile_ref.add(profile_data)
    
    return jsonify({'message': 'Profile created successfully'}), 200

'''
Login: Created an API for Login functionality
'''
@app.route(url_prefix + '/login', methods=['POST'])
def login():
    profile_data = request.json
    if not profile_data:
        return jsonify({'error': 'No data provided'}), 400
    
    # Check if all required fields are present
    required_fields = ['email', 'year_group']
    
    for field in required_fields:
        if field not in profile_data:
            return jsonify({'error': f'Missing required field: {field}'}), 400
    
    # Create a new document in Firestore
    profile_ref = db.collection('profiles')
    query = profile_ref.where('email', '==', profile_data['email']).where('year_group', '==', profile_data['year_group'])
    docs = query.get()
    if len(docs) == 1:
        profile = docs[0].to_dict()
        return jsonify(profile), 200
    else:
        return jsonify({'error': 'Profile not found'}), 404
    
'''
Friends: Created an API for viewing all the friends in my database
'''
@app.route(url_prefix + '/profiles/all', methods=['GET'])
def get_friends():
    profile_ref = db.collection('profiles')
    docs = profile_ref.get()
    profiles = [doc.to_dict() for doc in docs]
    return jsonify(profiles)

'''
View Profile Page/Section
This should display the profile information of a given user.
'''
@app.route(url_prefix + '/profiles', methods=['GET'])
def view_profile():
    student_id = request.args.get('student_id')
    profile_ref = db.collection('profiles').where('student_id', '==', student_id).get()
    profiles = [profile.to_dict() for profile in profile_ref]
    if profiles:
        return jsonify(profiles)
    else:
        return jsonify({'error': 'data not found'}), 404

'''
Edit Profile Page/Section
This should allow a user to edit all their profile information except their student ID, name, and email.
'''
# Edit Profile Page/Section
@app.route(url_prefix + '/profiles/<student_id>', methods=['PUT'])
def edit_profile(student_id):   
    query = db.collection('profiles').where('student_id', '==', student_id)
    docs = query.get()

    # If no matching documents are found, return a 404 error
    if len(docs) == 0:
        return jsonify({'error': 'No profile found with that student ID.'}), 404

    # Update each matching document with the new data
    update_data = request.json
    for doc in docs:
        doc.reference.set(update_data, merge=True)

    updated_docs = [doc.to_dict() for doc in query.get()]
    return jsonify({'success': 'Profile updated successfully.', 'data': updated_docs}), 200

# if __name__ == '__main__':
#     app.run()







