# Exam Results 2 Demo - Teacher App

## Exam Results 2 Demo

This project aims to demonstrate how fullstack applications can be built and deployed with ease using AWS Amplify Gen2.

The video demo below shows an Android app, built with Flutter, side by side with a Web app, built with Next.js. The Android app is used for data input and works only for authenticated users, while the Web app is open for guest or unauthenticated users. Because data schema is defined in the code, creating subscriptions for live-time event has never been easier: with one line of code, a filtered query will result in fast automatic data updates in the application.

I have made [a similar project](https://github.com/vg-cloud/210930unauthAmplify) using Amplify Gen1 several years ago. Amplify Gen2 has made the task of building fullstack applications much easier. In particular, the guest access is now configured by default. In addition, developers will like a code-first approach for the frontend completely in TypeScript. 

https://github.com/user-attachments/assets/e0e38442-82ba-4590-b180-5e42e53f517d


The Demo consists of three repositories:
- [Backend](https://github.com/vg-cloud/examres2): AWS backend made of Appsync (GraphQl API) with DynamoDB tables behind and authentication with Cognito (this repository). All the code which defines the backend services can be found in the 'amplify' folder.
- [Student App](https://github.com/vg-cloud/examres2_fe): Next.js/React frontend web application for guest or unauthenticated users. The app code can be found in the 'src' folder. The 'public' contains one image file. One line has been added to 'tsconfig.json' file. The content of other files is generated during installation of the app and the additional packages.
- [Teacher App](https://github.com/vg-cloud/examres2_teacher): Flutter frontend application for Teachers. The app code can be found in the 'lib/main.dart' file. Also, 'pubspec.yaml' file might have to be modified to install Amplify packages.

NB: The content of '.gitignore' has to be modified for the exclusion of 'amplify_outputs.*' file.

## The summary of the steps to build Teacher App.

### Prerequisites

Node and Flutter installed, AWS Backend deployed, new Flutter app created.

### Install Amplify dependencies

1. Run the following commands from the root folder of the repository:

`npm init -y`

`npm add --save-dev @aws-amplify/backend@latest @aws-amplify/backend-cli@latest typescript`

2. Add these lines to `pubspec.yaml`
```
  amplify_flutter: ^2.0.0
  amplify_auth_cognito: ^2.0.0
  amplify_authenticator: ^2.0.0
  amplify_api: ^2.0.0
```

### Connect to AWS resources

NB: Amplify cli uses the 'default' AWS profile, when '--profile' not specified.

This will generate the `amplify_outputs.dart` file that contains all the information about your backend at the 'lib' of the Flutter application project:

`npx ampx generate outputs --out-dir lib/ --format dart --branch master --app-id APP-ID`

The next command will create ModelProvider files in 'lib/amp-models'

`npx ampx generate graphql-client-code --out lib/amp-models --format modelgen --model-target dart --branch master --app-id APP-ID`

Once done, backend resources can be used in the code with the following: 
```
import 'amplify_outputs.dart';
import 'amp-models/ModelProvider.dart';
```
