[![License](https://img.shields.io/badge/License-Apache2-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0) [![Community](https://img.shields.io/badge/Join-Community-blue)](https://developer.ibm.com/callforcode/solutions/projects/get-started/)

_INSTRUCTIONS: This GitHub repository serves as a template you can use to create a new project for the [2023 Call for Code Global Challenge](https://developer.ibm.com/callforcode/global-challenge/). Use the **Use this template** button to create a new version of this repository and start entering content for your own Call for Code submission project. Make sure you have [registered for the 2023 Call for Code Global Challenge](https://developer.ibm.com/callforcode/global-challenge/register/) to access resources and full project submission instructions. Remove any "INSTRUCTIONS" sections when you are ready to submit your project._

_New to Git and GitHub? This free online course will get you up to speed quickly: [Getting Started with Git and GitHub](https://www.coursera.org/learn/getting-started-with-git-and-github)_.

# Replace this heading with your team/submission name

- [Project summary](#project-summary)
  - [The issue we are hoping to solve](#the-issue-we-are-hoping-to-solve)
  - [How our technology solution can help](#how-our-technology-solution-can-help)
  - [Our idea](#our-idea)
- [Technology implementation](#technology-implementation)
  - [Solution architecture](#solution-architecture)
- [Presentation materials](#presentation-materials)
  - [Solution demo video](#solution-demo-video)
  - [Project development roadmap](#project-development-roadmap)
- [About this template](#about-this-template)
  - [Contributing](#contributing)
  - [Versioning](#versioning)
  - [Authors](#authors)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)


## Project summary

### The issue we are hoping to solve

ChargePlug provides a user-friendly interface that allows drivers to easily locate charging stations in their area or along their route. The application provides information about the location of the charging station, the type of charger available, and the availability of the charging station.
### How our technology solution can help

ChargePlug uses the user's location to show a map of nearby charging stations for EV's and allow users to plan the route.

### Our idea

Our project ChargePlug involves the development of an application that locates electric vehicle charging stations, making it easier for drivers to access a sustainable and eco-friendly mode of transportation. Our application uses real-time data to provide users with accurate and up-to-date information on the nearest charging stations, along with details on their availability and charging type. The application is designed to be user-friendly, with an easy-to-use interface that allows users to quickly and easily find charging stations that meet their needs. Overall, ChargePlug provides a comprehensive solution for electric vehicle drivers who need to locate and use charging stations. By making it easier for drivers to recharge their vehicles, ChargePlug helps promote the adoption of electric vehicles and supports the transition to a cleaner and more sustainable transportation system.
## Technology implementation



### Solution architecture

Diagram and step-by-step description of the flow of our solution:

![architecture](https://user-images.githubusercontent.com/103206429/230450425-bcd519eb-d9e1-449d-98b4-dd1002adb373.png)


1. The user has to  login into the web-application.
2. The app will then detect the users current location (if the permission is granted by the user) and display the nearby EV charging stations.
3. Booking of slot can be done prior going to the station by checking the availablity status based on the real-time updates.
4. The app stores all the data on Firebase.

## Presentation materials


### Solution demo video

[![Watch the video](https://img.youtube.com/vi/XZazfZ5A0gk/0.jpg)](https://www.youtube.com/watch?v=XZazfZ5A0gk)]
### Project development roadmap

The project currently does the following things.

- The application can use GPS to locate the nearest charging stations to the user's current location. It can display the distance, type of charging port, and availability of the charging stations on the map.
- Users can book a charging station slot for a specific time period, allowing them to reserve a space and avoid any waiting time. The application can also provide real-time updates on the availability of charging stations.
- The application can allow users to add new charging stations on the map. Users can provide information such as the location, type of charging port, pricing structure, and reviews for the new charging station.
- The application should be compatible with different types of electric vehicles and charging ports, ensuring that users can find charging stations that are suitable for their vehicles.





---


### Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

### Authors

<a href="https://github.com/Call-for-Code/Project-Sample/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=Call-for-Code/Project-Sample" />
</a>

- **Billie Thompson** - _Initial work_ - [PurpleBooth](https://github.com/PurpleBooth)

### License

This project is licensed under the Apache 2 License - see the [LICENSE](LICENSE) file for details.

### Acknowledgments

- Based on [Billie Thompson's README template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2).
