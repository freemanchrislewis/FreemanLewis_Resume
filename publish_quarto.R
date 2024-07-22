# Install necessary package if not already installed
if (!require("quarto")) {
  install.packages("quarto")
}

# Load the quarto package
library(quarto)

# Set the working directory to your Quarto project
setwd("/Users/freemanlewis/Desktop/Github/Quarto Documents/")

# Render the Quarto document
quarto_render("FreemanLewis_Resume_20240722.qmd")

# Initialize a Git repository if not already initialized
system("git init")

# Add and commit files
system("git add .")
system('git commit -m "Initial commit"')

# Check the current branch name and switch to main if necessary
branch <- system("git branch --show-current", intern = TRUE)
if (branch == "") {
  system("git checkout -b main")
} else if (branch != "main") {
  system("git checkout main")
}

# Verify the remote URL
system("git remote -v")

# Push the files to the main branch of your remote repository
system("git push -u origin main")

# Publish to QuartoPub
quarto_publish(
  input = "FreemanLewis_Resume_20240722.qmd",
  repo = "https://github.com/freemanchrislewis/FreemanLewis_Resume.git"
)
