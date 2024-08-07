# iOS Home Task 

#Objective

In this task, I implemented the MVVM (Model-View-ViewModel) design pattern combined with Clean Architecture principles to achieve structured and maintainable code. Additionally, I integrated UI testing and unit testing to ensure robust functionality and validate the behavior of the application across different layers and components.

#Description

In the main screen I added the filter functionality per character status as well i added "Reset" filter option to reset back any selected filter

![Screenshot 2024-07-13 at 3 10 12 AM](https://github.com/user-attachments/assets/a978fc40-8357-40cf-a02c-10e28b6637da)

As well from the API side I fetched the first page from character list as a default, and whenever user scroll down the more data will be paginated accordingly, the more you swipe will call more pages and append new data to the current list.

As the Real app scenrios I did the following
*** Pagination will stop if you added a filter and will back whenever you choose "Reset" ***

![Screenshot 2024-07-13 at 3 12 37 AM](https://github.com/user-attachments/assets/31bd0aac-87d7-47d9-84e5-44b1282f7051)

** I did not added any libaray to make sure application performance is good and also tried to use deinit to deallocate some resources to save memory.

** I used another child branch from the master 
Branch Name is:- mvvm/main_dev

#Testing 

I have added Two Test types

- Unit Testing
- UI Testing

Both are added in a simple form to try to cover the happy and the worst scenrios.

![Screenshot 2024-07-13 at 2 04 18 AM](https://github.com/user-attachments/assets/a70a9ea0-e51c-4c86-906f-9c56be05ee3e)

#Challenges

- Time was the greatest challenge as i wanted to provide more View Binding Techinques like "RX-Swift" or "Combine" and adding more patterns like "VIPER" but wasn't able to catch the time frame, as well wasn't able to do the Integration test which will be a nice thing to have.


#App Screen Shots

![simulator_screenshot_6B84AE55-90E5-467B-BC4E-A082FCD046F3](https://github.com/user-attachments/assets/05216f8f-ff9c-43a9-94b5-5a5af8778855)


![simulator_screenshot_0013081D-5BBD-45D4-BD3B-D9641D98BA75](https://github.com/user-attachments/assets/a8075810-e436-41df-9251-e7ccb16b7807)



