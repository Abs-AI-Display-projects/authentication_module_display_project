# authentication_module_display_project
This repo is used for displaying a sample of Abs.AI App Development Team. It includes a part of Mali Gali - مالي جالي App produced by the company.

Mali Gali - مالي جالي app is an android app produced by Abs.AI for store management and selling assistance for small to medium sized local shop owners.
For displaying and showcasing Abs.AI App development services, this repository holds a single module for illustrating the coding structure and quality produced by the team. The displayed module is the user's (shop owner) authentication module for the app. 

### Main specs and requirements for the authentication module:
- For user validation and authentication, phone authentication is used.
- User should register an account first where he is required to clarify his shop's info.
- The shop's GPS location is crucial for the app functioning.
- Three main screens are required in this module: Register, Signup, and The OTP Validation Screen.
- Error handling is important during authentication to prevent any unexpected displays in the UI.

### Technologies and services used in this module:
- For authentication, Firebase Phone Authentication Service is used.
- For shop GPS Location, Google Maps APIs are used.
- For shop Info storage, Firebase Database is used.
- For state management through the module, Provider State Managament Technique is used. 
- For codebase structure organization,  MVVM architecture is used.
- For error handling, Error Handler is used.

### Codebase structure:
	lib:.
	|   constants.dart
	|   README.md
	|   routes.dart
	|   tree.txt
	|   
	+---BusinessLogic
	|   +---data
	|   |   \---auth_repo
	|   |           auth_repo.dart
	|   |           auth_repo_implementation.dart
	|   |           
	|   +---Models
	|   |       auth_owner_model.dart
	|   |       
	|   +---Services
	|   |   |   location_services.dart
	|   |   |   
	|   |   \---FireBaseServices
	|   |           create_and_delete_db_services.dart
	|   |           firebase_phone_auth_helper.dart
	|   |           firebase_validation_services.dart
	|   |           
	|   +---utils
	|   |   |   globalSnackBar.dart
	|   |   |   shareable _data.dart
	|   |   |   
	|   |   +---dropdownLists
	|   |   |       registerDropDownItems.dart
	|   |   |       
	|   |   +---error
	|   |   |       failure.dart
	|   |   |       validation_exception.dart
	|   |   |       
	|   |   \---function
	|   |           helper_function.dart
	|   |           
	|   \---view_models
	|       \---authentication_view_models
	|               authentication_view_model.dart
	|               
	+---components
	|       buttons.dart
	|       customTextField.dart
	|       dropDownBox.dart
	|       orDivider.dart
	|       returnAppBar.dart
	|       
	+---scaffoldComponents
	|       GeneralScaffold.dart
	|       ScaffoldDrawer.dart
	|       userIconButton.dart
	|       
	\---screens
    	\---authentication
        	+---free_trial
        	|       free_trail_Screen.dart
        	|       
        	+---login_or_signup
        	|       login_or_signup_body.dart
        	|       login_or_signup_screen.dart
        	|       
        	+---log_in
        	|       log_in_body.dart
        	|       log_in_screen.dart
        	|       
        	+---otp
        	|       otp_body.dart
        	|       otp_screen.dart
        	|       
        	\---sign_up
            	|   sign_up_body.dart
            	|   sign_up_screen.dart
            	|   
            	\---sub_screens
                    	privacy_policy_screen.dart
                    	select_location_on_map_screen.dart
                    	terms_and_conditions_screen.dart

### UI Design:

![Welcome Screen](https://github.com/NadaAbbas/authentication_module_display_project/assets/123370196/3e3c2d10-0da6-450c-b8a4-a2b81e0dc99f)



