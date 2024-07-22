# Install necessary package if not already installed
if (!require("quarto")) {
  install.packages("quarto")
}

# Load the quarto package
library(quarto)

# Set the working directory to your Quarto project
# Replace this with the path to your project directory
setwd("/Users/freemanlewis/Desktop/Github/Quarto Documents/")

# Render the Quarto document
quarto_render("FreemanLewis_Resume_20240722.qmd")

# Initialize a Git repository if not already initialized
system("git init")
system("git add .")
system('git commit -m "Initial commit"')

# Add the remote GitHub repository
system('git remote add origin https://github.com/freemanchrislewis/FreemanLewis_Resume.git')

# Check the current branch name
branch <- system("git branch --show-current", intern = TRUE)
if (branch == "") {
  # If no branch is set, create and switch to 'main' branch
  system("git checkout -b main")
  branch <- "main"
} else if (branch != "main") {
  # If the current branch is not 'main', switch to 'main' branch
  system("git checkout main")
}

# Push the files to the main branch of your remote repository
system("git push -u origin main")

# Publish to QuartoPub
quarto_publish(
  input = "FreemanLewis_Resume_20240722.qmd",
  repo = "https://github.com/freemanchrislewis/FreemanLewis_Resume.git"
)