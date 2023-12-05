import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('656ec9f0db4b39d87ad0')
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development