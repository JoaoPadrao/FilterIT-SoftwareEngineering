
# Requirements

## User stories
### Story nº 1
As a user, I want to search for a specific job offer, without having to scroll through all the ads, so that I can find the job I want faster.

### User interface mockup
![Search java png](https://user-images.githubusercontent.com/113979321/224019759-2fe244af-46fe-4ee3-a018-cf15af3a58c4.png)

### Acceptance tests
```Gherkin
Scenario: Search for Java Developer jobs.
  Given The search screen
  When I tap the search bar
  And I insert "Java Developer"
  And I tap the search button,
  Then the results of the search for "Java Developer" appear
```

### Value and effort estimation
- Value: Must-have
- Effort: 8

---

### Story nº 2
As a user, I want to see the reviews and/or opinions on a certain job offer, so that I can have a better idea of what the job is like.

### User interface mockup
![Reviews png (2)](https://user-images.githubusercontent.com/113979321/223873246-7259614b-3029-4e5e-8978-56b1f0723dc3.png)

### Acceptance tests
```Gherkin
Scenario: See the reviews about a job offer.
  Given The post of a job offer
  When I tap "Reviews",
  Then the reviews about the job offer appear
```

### Value and effort estimation
- Value: Should-have
- Effort: 8

---

### Story nº 3
As a user, I want to be able to filter job offers by different criteria, not only to make my search easier and also to find the job I want faster, but also to compare different job offers.

### User interface mockup
![Filter png](https://user-images.githubusercontent.com/113979321/223870114-433fb14e-29c5-4b66-a5ae-0e3529ff408b.png)

### Acceptance tests
```Gherkin
Scenario: Filter the search.
  Given The search screen
  When I tap the filters button
  And I select the criteria I want to filter by
  And I tap "Search",
  Then the results of the search for appear filtered by the criteria I selected
```

### Value and effort estimation
- Value: Must-have
- Effort: 13

---

### Story nº 4
As a user, I want to have easy and interactive access to job offers in different locations, so that I can find a job in a place that I prefer.

### User interface mockup
![principal png](https://user-images.githubusercontent.com/113979321/223876487-42e034ea-06df-4224-9ef6-a50b181a8726.png)

### Acceptance tests
```Gherkin
Scenario: See the job offers in Porto.
  Given The main screen
  When I tap "Porto",
  Then the job offers in Porto district appear
```

### Value and effort estimation
- Value: Must-have
- Effort: 8

---

### Story nº 5
As a user, I want to be able to mark a job offer as favorite, so that I can easily find it later.

### User interface mockup
![Favorite Search png](https://user-images.githubusercontent.com/113979321/223871250-0ad0fa6c-c05e-4220-a2a9-1e6848e6a3bc.png)

### Acceptance tests
```Gherkin
Scenario: Mark a job offer as favorite.
  Given The post of a job offer
  When I tap the favorite button,
  Then the job offer is marked as favorite
```

### Value and effort estimation
- Value: Should-have
- Effort: 5

---

### Story nº 6
As a user, I want to be able to see the job offers that I have marked as favorite, so that I can easily find them later.

### User interface mockup
![Favorites png](https://user-images.githubusercontent.com/113979321/223872374-3722889a-731b-438c-8b80-368fc3bb67bd.png)

### Acceptance tests
```Gherkin
Scenario: See the job offers that I have marked as favorite.
  Given The navigation drawer
  When I tap "Favorites",
  Then the job offers that I have marked as favorite appear
```

### Value and effort estimation
- Value: Must-have
- Effort: 5

---

### Story nº 7
As a user, I want to be able to rate and review a job offer, so that I can give my opinion on the job.
### User interface mockup
![Rate review png](https://user-images.githubusercontent.com/113979321/223874166-f8bbdaf8-db18-482b-b625-fea630b01b12.png)

### Acceptance tests
```Gherkin
Scenario: Rate a job offer.
  Given The job offer post
  When I tap "See more"
  And I tap the star
  And I select the rate
  And I tap the send button,
  Then my review appears
```

### Value and effort estimation
- Value: Should-have
- Effort: 8

---

### Story nº 8
As a user, I want to see detailed information about a job offer, so that I can have a better idea of what the job is like.

### User interface mockup
![Specific job png](https://user-images.githubusercontent.com/113979321/223875276-a81be2fb-e670-4ce8-abc3-4b79b4104fc9.png)

### Acceptance tests
```Gherkin
Scenario: See the details of a job offer.
  Given The search screen
  When I tap a job offer,
  Then the details of the job offer appear
```

### Value and effort estimation
- Value: Must-have
- Effort: 5

---

### Story nº 9
As a user, I want to be able to navigate easily through the app pages.

### User interface mockup
![bar search png](https://user-images.githubusercontent.com/113979321/224378031-0c5fbe72-1482-47f5-b048-82ee230c0d56.png)

### Acceptance tests
```Gherkin
Scenario: Switch pages.
  Given any page
  When I tap the top left corner button
  And the navigation drawer opens,
  Then I can select which page to navigate to
```

### Value and effort estimation
- Value: Must-have
- Effort: 5

---

### Story nº 10
As a user, I want to see in the job offer the average rating of the job, so that I can have a better idea of what the job is like.

### User interface mockup
![Specific job png](https://user-images.githubusercontent.com/113979321/223875276-a81be2fb-e670-4ce8-abc3-4b79b4104fc9.png)

### Acceptance tests
```Gherkin
Scenario: See the average rating of a job offer.
  Given The job offer post
  When I tap the arrow button,
  And the details of the job offer appear,
  Then I can see the rating of the job post
```

### Value and effort estimation
- Value: Should-have
- Effort: 5

---

### Story nº 11
As a user, I want to register/login in an account, so that I can use my account in different devices.

### User interface mockup
![LOGIN](https://user-images.githubusercontent.com/113979321/227995040-5357a2a3-3ec5-4f74-bb51-0466d8be3a9e.png)

### Acceptance tests
```Gherkin
Scenario: Register in an account.
  Given The login screen
  When I tap "Register"
  And I insert my email
  And I insert my password
  And I tap "Register",
  Then I am registered in an account
```
```Gherkin
Scenario: Login in an account.
  Given The login screen
  When I insert my email
  And I insert my password
  And I tap "Login",
  Then I am logged in my account
```

### Value and effort estimation
- Value: Must-have
- Effort: 5

---

### Story nº 12
As a user, I want to have a personal profile, so that I can keep track of my reviews and favourites.

### User interface mockup
![Nav_Bar](https://user-images.githubusercontent.com/113979321/228002670-1cddf062-854c-41b9-8899-e9e9a24464ed.png)
![PROFILE](https://user-images.githubusercontent.com/113979321/228015709-89176d23-402e-4312-8770-f34ec3520c0e.png)

### Acceptance tests
```Gherkin
Scenario: See my profile.
  Given The navigation drawer
  When I tap "Profile",
  Then my profile appears
```

### Value and effort estimation
- Value: Must-have
- Effort: 8

---

### Story nº 13
As a user, I want to be able to edit my profile, so that I can update/change the information in it

### User interface mockup
![EDIT_PROFILE](https://user-images.githubusercontent.com/113979321/228015725-cb7a17ee-2ffd-4602-9f2c-3860d7545869.png)

### Acceptance tests
```Gherkin
Scenario: Edit my profile.
  Given The profile screen
  When I tap "Edit profile",
  Then I can edit my profile
```

### Value and effort estimation
- Value: Should-have
- Effort: 8

<br>

## Domain Model
Our domain model is composed of the following classes:
- `User`: represents a user of the application. It has the following attributes:
  - `personal information`: information that is displayed in the user's profile, such as name, email, socials, etc
  - `favourites list`: list of job offers that the user has marked as favourite
  - `login credentials`: email and password that the user uses to login in the application
- `Job Post`: represents a job offer. It has the following attributes:
  - `job offer details`: information about the job offer, such as title, description, location, etc
  - `company details`: information about the company that is offering the job, such as name, logo, socials, etc
- `Review`: represents a review of a job offer. It has the following attributes:
  - `rating`: rating of the job offer
  - `comment`: comment about the job offer

Here's an explanation of the relationships between the classes:
- `User` can see multiple `Job Posts` and have multiple `Job Posts` as favourites as well
- The same `Job Post` can be seen and marked as favourite by multiple `Users`
- `User` can write multiple `Reviews` and `Job Posts` can have multiple `Reviews` referring to it. However, a `Review` can only be written by one `User` and can only refer to one `Job Post`

<p align="center" justify="center">
  <img src="../images/domain_model.png" alt="Domain Model">
</p>
<p align="center" justify="center">
  <b>Figure 1:</b> Domain model of the FilterIT application
</p>
<br>

