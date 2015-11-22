# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)    

  end
  #fail "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #fail "Unimplemented"
  
  i1 = page.text.index(e1)
  i2 = page.text.index(e2)
  if not i1
    assert false
  end
  if not i2
    assert false
  end
  if not (i1 < i2)
    assert false
  end  
  
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  #fail "Unimplemented"
  
  rating_list.split(",") do |rating|
    if uncheck
      When %Q{"I uncheck"ratings[#{rating}]}
    else
      When %Q{"I check"ratings[#{rating}]}
    end
  end
  
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  #fail "Unimplemented"
  
  Movie.all.each do |movie|
    if not page.text.index(movie.title)
      assert false
    end
  end
  
end
