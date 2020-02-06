# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT title, SUM(amount) 
  FROM projects 
  JOIN pledges 
  WHERE project_id = projects.id 
  GROUP BY projects.title 
  ORDER BY title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT name, age, SUM(amount) 
  FROM users 
  JOIN pledges 
  WHERE user_id = users.id 
  GROUP BY name 
  ORDER BY name"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT title, ((select SUM(amount) FROM pledges GROUP BY project_id) - (SELECT funding_goal FROM projects)) AS amount_over_goal 
  FROM projects 
  JOIN pledges 
  WHERE project_id = projects.id 
  GROUP BY title
  HAVING amount_over_goal > 0
  "
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT name, SUM(amount) AS total_amounts 
  FROM users 
  JOIN pledges 
  WHERE user_id = users.id 
  GROUP BY name 
  ORDER BY total_amounts"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT category, amount
  FROM projects
  JOIN pledges
  ON project_id = projects.id
  WHERE category = 'music'
  "
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT category, SUM(amount)
  FROM projects
  JOIN pledges
  ON project_id = projects.id
  WHERE category = 'books'
  GROUP BY category
  "
end
