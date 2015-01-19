---
title: "README"
author: "Suman Mandal"
date: "Monday, January 19, 2015"
output: html_document
---

Getting and Cleaning Data Course Project
========================================

Welcome to the repository of the final project for Getting and Cleaning Data Course.

This repository contains the following files and folders.

* **run_analysis.R :** The R script processes the data and generates the tidy dataset.
* **UCI_HAR_Dataset.txt :** The txt file contains the required tidy dataset.
* **CodeBook.md :** The code book describes the variables, the data, and any transformations or work that is performed to clean up the data.
* **README.md :** The README file explains about all the files present in this repository.

To preform this data cleaning activity user has to **'source'** the **run_analysis.R** file into R.
Then simply invoke the function **clean.data()** which will generate the clean **UCI_HAR_Dataset.txt** file in the data directory **"./data/UCI HAR Dataset"** relative to the R workspace.