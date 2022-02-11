# Pewlett-Hackard-Analysis To Build A Stronger Workforce
## Overview of the analysis:
Pewlett-Hackards (PH) is a large company which has about 300,000 employees. The company is in the business for a long time. As baby-boomers began to retire at a rapid rate, Pewlett Hackard is preparing to fill in the gaps may be created when the baby-boomers retire. If this warning not attended timely, a shortage of skilled workforce will create a silver tsunami. To avoid any negative impact, the company is exploring data to offer packagages to qualified employees. At the same time, the company would like to analyze which number of potential retirees bydepartment. With the aid of this analysis, the HR can create meaningful mentoring prorams with qualified employees and fill in the experience gap, continue it's journey with a strong workforce in the future.

# Resources:
To assist the HR team, I needed to perform anaysis using SQL with many relational databases. Below are the tool utilized:
- PostgresSQL
- pgAdmin 
- Quick DBD (ERD creation tool)
- tables supplied by Pewlett-Hackard in CSV format

## Results:
I began the analysis with physical ERD of all the relevant tables. Uploaded the CSV files into their designated tables that I created prior to importing the data. Once all the CSV files were imported, SQL queries uncovered many of the questions raised by PH's management and HR Department. 

 ![ERD](https://github.com/shamayun/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/ERD%20for%20PH%20employee%20DB.png)
### Positions to Fulfill:
PH was eager to find out which department would have the hardest impact followed by a summary of number of employees by department whose retirement is coming up soon. I was able to generate a query which summarized accurately the number of potental retirees' titles by departments:

![Potential Retirees' Titles](https://github.com/shamayun/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/employees%20retiring%20by%20titles.png)

Additional findings from the above queries were supplies to HR managers to aid their decision making:

- 24% of the current employees within the company, are eligible for retirement.
- Senior Engineer, Senior Staff and Engineer's hold the lion's share (23.9%) of employees likely preparing for retirement.
- Departments with the highest number of potential retirees are Development(25.45%),Production(22.30%) and Sales(7.27%).
- Even though Development, Production, Sales have highest potential retiress, these departments also have highest number of mentors, 435, 356, and 272 respectively.

Following is a category by position which shows the numbers of position to be filled, mentors by the position and current employees who would potentially serve for a longer term.

![Categories by Title](https://github.com/shamayun/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Category%20by%20title.png)

### Mentorship Eligiblity:
PH is now aware of the departments that may get impacted by the silver tsunami. PH's first step to mitigate the challenge was to create a superior mentorship program, comprised of tenured employees, who has served PH for the past decades and ready to continue the legacy through mentoring. Image below shows the a partial list of all mentors:

![Partial Mentor List](https://github.com/shamayun/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/eligible_mentors.png)
## Summary: 
It would be a challenge on any day to fill back 72K tenured employees. Fortunutely eought, there are a lot of mentors from the respective departments to assist in hiring, training an shaping towards a great future generation of employees. Current mentor to trainee ration is 1:47. I would recommend the managment to consider increasing the number of mentors to creat a effective training program, as the ideal mentor to mentee ratio is 1:20.
 
 ![Mentors Availability by Department](https://github.com/shamayun/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Mentor%20Availability%20by%20Departments.png)
 ![Potential Retirees by Department](https://github.com/shamayun/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Retirments%20by%20Departments.png)
