# 📸 Instagram Influencer Account Analysis using SQL

**Codebasics Data Analyst Virtual Internship | AtliQ Technologies**

This project focuses on analyzing the performance of a **Tech Influencer’s Instagram account** using **SQL**.
The goal is to uncover trends, evaluate engagement, and identify strategies that drive better follower growth and content reach.

---

## 🎯 Project Objective

Analyze the influencer’s **Instagram activity data** (Jan–Sept) to answer key business questions using SQL.
The project covers **data exploration, aggregations, CTEs, stored procedures, and reporting logic** to generate actionable insights.

---

## 🗂️ Dataset Overview

* **fact_content** – contains post-level metrics such as impressions, reach, likes, comments, saves, and shares.
* **dim_date** – holds calendar details (date, month, weekday, etc.).
* **fact_profile** – includes profile visits and follower growth per day.

---

## Tasks Performed

### 1️⃣ Unique Post Types

Identify all unique `post_type` values from the `fact_content` table to understand content variety.




### 2️⃣ Highest & Lowest Impressions by Post Type

Find the **maximum and minimum impressions** for each post type.




### 3️⃣ Weekend Posts (March & April)

Filtered and exported all posts published on **weekends (Sat/Sun)** during **March & April** to a `.csv` file for pattern analysis.




### 4️⃣ Monthly Account Statistics

Created a monthly summary report containing:

* `month_name`
* `total_profile_visits`
* `total_new_followers`


### 5️⃣ Likes per Post Category (July)

Used a **CTE** to calculate total likes per `post_category` during **July**, sorted by descending order.


### 6️⃣ Unique Post Categories per Month

Generated a report listing each `month_name`, all unique `post_category_names`, and their counts.


### 7️⃣ Reach Percentage by Post Type

Calculated total reach and percentage share for each post type.

### 8️⃣ Quarterly Engagement Report

Grouped months into quarters (Q1–Q3) and reported total comments and saves by `post_category`.


### 9️⃣ Top 3 Days by New Followers (Each Month)

Used ranking logic to identify the top 3 performing dates for follower growth in each month.

### 🔟 Stored Procedure – Total Shares by Post Type

Created a stored procedure accepting `Week_no` as input to return:

* `post_type`
* `total_shares`

**Purpose:** Automate weekly tracking of share performance.

---

## 📈 Key Insights Summary

* **Reels dominate engagement and reach** — they’re the primary growth driver.
* **Tech Tips, Mobiles, and Other Gadget content** perform consistently well.
* **May–June** were peak growth months for both reach and new followers.
* **Engagement dips** in late Q3 suggest a need for more content variation.

---

## 💡 Recommendations

* Focus on **Reels** and short-format content for maximum visibility.
* Maintain **content diversity** (at least 5+ categories per month).
* Review and replicate **May–June content strategy** for sustained growth.
* Track **Follower Conversion Rate (New Followers ÷ Profile Visits)** monthly.

---
The Attached Presentation has detailed insights and Recommendations regarding the Instagram Account.

---

## 🏁 Final Takeaway

This project highlights how **SQL can uncover actionable marketing insights** from social media data empowering influencers and brands to make **data-driven content decisions**.




