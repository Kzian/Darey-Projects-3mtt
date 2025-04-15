# greenwood-library-website

Install Git

Visit the official website [Git](https://git-scm.com/downloads) and download the version of git for your operating system.


## Capstone Project - Enhancing a Community Library Website

In this project, a simulation of how two team members contributed to a project will be shown. Morgan (Kzian), Jamie (Kzian), and cyb3rry

### Created branches and contributors

1. `main` - cyb3rry 
2. `add-book-review` - Morgan
3. `update-events` - Jamie


## Create a GitHub Repository

1. **Create a New Repository**:
   - On GitHub, click the "+" icon in the top-right corner and select "New repository".
   - Name the repository `greenwood-library-website`.
   - Optionally, add a description.
   - Choose "Public" or "Private" visibility.
   - Check the box to "Initialize this repository with a README".
   - Click "Create repository".


---
---

## Clone the Repository

1. **Copy the Repository URL**:
   - On the repository page, click the "Code" button.
   - Copy the HTTPS URL (e.g., `git clone https://github.com/cyb3rry/greenwood-library-website.git`).
    


2. **Clone the Repository Locally**: Each contributor (Morgan and Jamie) will do this
   - Open your terminal or command prompt.
   - Create a folder named `git-capstone-project` in your desired location:
     ```bash
     mkdir git-capstone-project
     ```


   - Navigate into 'git-capstone-project' folder 
     ```bash
     cd git-capstone-project
     ```

 
   - Clone the repository using the copied URL:
     ```bash
     git clone https://github.com/cyb3rry/greenwood-library-website.git
     ```

   - Navigate into the cloned repository
   ```bash
     cd greenwood-library-website
     ```

![mkdir&cloning](img/mkdir%20and%20cloning.png)

---

## Make Changes and Commit

1. **Create New Files**:
   - Create empty `About-Us.html`, `Events.html`, `Contact-Us.html`, `Home.html` files:
     ```bash
     touch About-Us.html
     touch Contact-Us.html
     touch Events.html
     touch Home.html
     ```
   - Add some contents to the files using a text editor or IDE.

   ![Create HTML FileS](img/creating%20html%20files.png)

   ![HTML Page Edit](img/html%20page%20edit.png)

2. **Check Git Status, Stage Changes, Commit changes, and push to Github**:
   - Run the following command to see the changes that have not been staged:
     ```bash
     git status
     git add .
     git commit -m "first commmit"
     git push origin main
     ```
3. **Verify on GitHub**:
   - Go to your repository on GitHub and verify that the html files have been added.

![First commit](img/first%20commit.png)

---

# PART 2: Simulating Morgan and Jamie's Work

This section shows the steps Morgan and Jamie took to contribute to the project already created by cyb3rry.

---

### To begin, Morgan and Jamie would create a separate branch each, send out a pull request, and merge with the original branch so that their changes would reflect.

### Simulating Morgan's Contribution

#### Steps:
1. **Navigate to the project directory** you just cloned using the command:
   ```bash
   cd greenwood-library-website
   ```

2. **Create a new branch called `add-book-review`:**
        
Before creating a branch, pull to be sure you are working with the recent work:
```bash
git pull origin main
```
![First pull](img/gitpull1.png)

   ```bash
   git checkout -b add-book-review
   ```
![First Branch](img/first%20branch.png)

   Push the branch to github
   ```bash
   git push origin add-book-reviews
   ```
![Push1](img/git%20push2.png)

3. **Verify pull request**: go to github and verify that the pull request went through. After that, compare and pull request, create pull request, and merge pull request.

Morgan's compare and pull
![Morgan's compare and pull](img/pr1.png)
Reviewer added
![Add a reviewer](img/pr2.png)
Ready to be reviewed
![Pull request sent to another team member](img/pr5.png)
Reviewed
![Reviewed and ready to merge](img/pr7.png)
Merged
![Merged](img/merged1.png)


---

### Simulating Jamie's Contribution

### Steps:
1. **Switch back to the main branch**:
   ```bash
   git checkout main
   ```
   ![back to main branch](img/b2branch1.png)

2. **Create a new branch for Jamie called `update-events`:**; Make the necessary changes to the project (e.g., include upcoming events`).

Before creating a branch, pull to be sure you are working with the recent work:
```bash
git pull origin main
```
![Second pull](img/updateevents%20pull.png)


   ```bash
   git checkout -b update-events
   ```
![Second Branch](img/branch2.png)

Push the branch to github
   ```bash
   git push origin update-events
   ```
![Push2](img/jpush.png)

3. **Verify pull request**: go to github and verify that the pull request went through. After that, compare and pull request, create pull request, and merge pull request.

Jamie's compare and pull
![Jamie's compare and pull](img/jpr.png)
    Kzian's PR: goes to Morgan's branch to raise a pr
    ![1](img/pr8.png)
    ![2](img/pr9.png)
    On creating the pr, a conflict was noticed
    ![3](img/pr10.png)
    ![4](img/pr11.png)
    Ongoing review
    ![5](img/review.png)
    ![6](img/review2.png)
    ![7](img/review3.png)
    ![8](img/review4.png)
    Merged
    ![resolved conflict](img/review5.png)

Ready to be reviewed
![Second Pull request sent to another team member](img/review7.png)
Ongoing review2
![1](img/review8.png)
![2](img/review9.png)
![3](img/review10.png)
Merged (Final)
![Merged](img/merged2.png)



Switch back to main branch and pull

![Done](img/b2branch.png)
---

### Final verification on github

[Github](https://github.com/cyb3rry/greenwood-library-website)


## All contributors' updates were successfully merged with the main branch.


