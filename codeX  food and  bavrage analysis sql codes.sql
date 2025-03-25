select * from dim_cities
select *  from dim_repondents  
select * from fact_survey_responses

-- Who prefers energy drink more? (male/female/non-binary?
select gender,count(*) as count_of_preference
from dim_repondents
group by gender
order by count_of_preference desc

-- Which age group prefers energy drinks more?
select age,count(*) as number_of_preference
from dim_repondents
group by age
order by number_of_preference desc

-- Which type of marketing reaches the most Youth (15-18)?
select fs.Marketing_channels,count(fs.Respondent_ID) as count_of_pre
from fact_survey_responses fs join dim_repondents dr on fs.respondent_id = dr.respondent_id
where dr.age = '15-18'
group by fs.Marketing_channels
order by count_of_pre desc

--  What are the preferred ingredients of energy drinks among respondents?

select Ingredients_expected,count(*) as preferred_ingredients
from fact_survey_responses
group by Ingredients_expected
order by preferred_ingredients desc

-- b. What packaging preferences do respondents have for energy drinks?
 
 select Packaging_preference,count(*) as number_of_Packaging_preference
from fact_survey_responses
group by Packaging_preference
order by number_of_Packaging_preference desc

-- Who are the current market leaders ?

select Current_brands,count(*) as number_of_pre
from fact_survey_responses
group by Current_brands
order by number_of_pre desc

-- What are the primary reasons consumers prefer those brands over ours?
select Reasons_for_choosing_brands,count(*) as num_of_choosing
from fact_survey_responses
group by Reasons_for_choosing_brands
order by num_of_choosing desc

-- Which marketing channel can be used to reach more customers?
select Marketing_channels,count(*) as cnt_of_channel
from fact_survey_responses
group by Marketing_channels
order by 2 desc

-- How effective are different marketing strategies and channels in reaching our customers?
select Consume_time,count(*) as cnt_consumption
from fact_survey_responses
group by Consume_time
order by 2 desc

select Consume_reason,count(*) as cnt_consumption
from fact_survey_responses
group by Consume_reason
order by 2 desc

-- What do people think about our brand? (overall rating)
select Brand_perception, count(*) as Brand_rating
from fact_survey_responses
group by Brand_perception
order by Brand_rating desc;

select Taste_experience, count(*) as Taste_rating
from fact_survey_responses
group by Taste_experience
order by Taste_rating desc;

-- Which cities do we need to focus more on?
select c.city as city,c.Tier,count(r.Respondent_ID) as response_count,count(r.Respondent_ID)/10000*100.0 as response_percent
from dim_repondents r 
      join dim_cities c on c.city_id = r.city_id
group by c.city,c.Tier
order by response_count asc,response_percent

-- Where do respondents prefer to purchase energy drinks?
select Purchase_location,count(*) as cnt_Of_pLocation
from fact_survey_responses 
group by Purchase_location
order by cnt_Of_pLocation desc

-- . What are the typical consumption situations for energy drinks among respondents?
select Typical_consumption_situations,count(*) as cnt_of_consum_situation
from fact_survey_responses
group by Typical_consumption_situations
order by 2 desc

-- #What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
 
select Limited_edition_packaging, count(*) as Survey_answer
from fact_survey_responses
group by Limited_edition_packaging
order by Survey_answer desc;

select Price_range, count(*) as desired_price
from fact_survey_responses
group by Price_range
order by desired_price desc;

-- Which area of business should we focus more on our product development? (Branding/taste/availability)
select Reasons_for_choosing_brands, count(*) as reasons
from fact_survey_responses
group by Reasons_for_choosing_brands
order by reasons desc;

#secondary Questions
-- Improvment desired in our brand
select Improvements_desired, count(*) as total
from fact_survey_responses
group by Improvements_desired
order by total desc;

-- Major cosume reason?
select Consume_reason as benefits, count(*) as total
from fact_survey_responses
group by Consume_reason
order by total desc;


-- Reason from preventing our brand
select Reasons_preventing_trying, count(*) as total
from fact_survey_responses
group by Reasons_preventing_trying
order by total desc;

-- are people intrest in organic?
select Interest_in_natural_or_organic, count(*) as total
from fact_survey_responses
group by Interest_in_natural_or_organic
order by total desc;

-- people heard before
select Heard_before, count(*) as total
from fact_survey_responses
where Current_brands = 'codex'
group by Heard_before
order by total desc;


 
-- Tried_before
select Tried_before, count(*) as total
from fact_survey_responses
where Current_brands = 'codex'
group by Tried_before
order by total desc;


































