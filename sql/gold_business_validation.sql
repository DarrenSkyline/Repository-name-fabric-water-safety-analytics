-- =========================================================
-- Community Water Safety Analytics
-- Gold Layer Business Validation
-- =========================================================

-- 1. How many events have been delivered?
-- 2. How many participants have been reached?
-- Event delivery and participant reach
SELECT
    COUNT(*) AS delivery_records,
    COUNT(DISTINCT event_group_id) AS event_groups,
    SUM(people_reached) AS total_people_reached
FROM dbo.gold_fact_event_delivery;

-- 3. How has event delivery and participation changed over time?
-- Delivery trend over time
SELECT
    d.year_month,
    COUNT(*) AS delivery_records,
    COUNT(DISTINCT f.event_group_id) AS event_groups,
    SUM(f.people_reached) AS people_reached
FROM dbo.gold_fact_event_delivery AS f
INNER JOIN dbo.gold_dim_date AS d
    ON f.event_date_key = d.date_key
GROUP BY
    d.year_month
ORDER BY
    d.year_month;

-- 4. Which regions have the highest and lowest participation?
-- Regional participation
SELECT
    l.region,
    COUNT(*) AS delivery_records,
    COUNT(DISTINCT f.event_group_id) AS event_groups,
    SUM(f.people_reached) AS people_reached
FROM dbo.gold_fact_event_delivery AS f
INNER JOIN dbo.gold_dim_location AS l
    ON f.location_id = l.location_id
GROUP BY
    l.region
ORDER BY
    people_reached DESC;

-- 5. How does actual attendance compare with registered attendance?
-- Registration vs actual attendance
SELECT
    event_type,
    COUNT(*) AS registered_events,
    SUM(attended_count) AS total_attended,

    SUM(attended_count) - SUM(registered_count)
        AS attendance_variance,

    ROUND(
        100.00 * SUM(attended_count) 
        / NULLIF(SUM(registered_count), 0),
        1
        ) AS attendance_rate_pct
FROM dbo.gold_fact_event_delivery
WHERE registered_count IS NOT NULL
GROUP BY
    event_type
ORDER BY
    attendance_rate_pct DESC;


-- 6. Which programme types reach the greatest number of participants?
-- programme type of participants
SELECT
    programme_type,
    COUNT(*) AS delivery_records,
    SUM(people_reached) AS people_reached
FROM dbo.gold_fact_event_delivery
GROUP BY
    programme_type
ORDER BY
    people_reached DESC;

-- 7. Which languages are used?
-- 8. How does participation differ by language?
-- Languages used
SELECT
    delivery_language,
    COUNT(*) AS delivery_records,
    SUM(people_reached) AS people_reached
FROM dbo.gold_fact_event_delivery
GROUP BY
    delivery_language
ORDER BY
    people_reached DESC;

-- 9. Which venue types are most frequently used?
-- Venue types
SELECT
    l.venue_category,
    COUNT(*) AS delivery_records,
    SUM(f.people_reached) AS people_reached
FROM dbo.gold_fact_event_delivery AS f
INNER JOIN dbo.gold_dim_location AS l
    ON f.location_id = l.location_id
GROUP BY
    l.venue_category
ORDER BY
    delivery_records DESC,
    people_reached DESC;

-- 10. What is the average participant satisfaction score?
-- Average satisfaction score
SELECT
    event_type,
    COUNT(satisfaction_score) AS rated_events,
    ROUND(
        AVG(satisfaction_score),
        2
    ) AS avg_satisfaction_score
FROM dbo.gold_fact_event_delivery
WHERE satisfaction_score IS NOT NULL
GROUP BY
    event_type
ORDER BY
    avg_satisfaction_score DESC;

-- 11. Which educators have delivered the most events?
SELECT
    e.educator_id,
    e.educator_name,
    e.experience_level,

    COUNT(DISTINCT b.event_id)
        AS events_delivered,
    
    ROUND(
        SUM(b.hours_worked),
        1
    ) AS total_hours
FROM dbo.gold_bridge_event_educator AS b
INNER JOIN dbo.gold_dim_educator AS e
    ON b.educator_id = e.educator_id
GROUP BY
    e.educator_id,
    e.educator_name,
    e.experience_level
ORDER BY
    events_delivered DESC,
    total_hours DESC;

-- 12. Which locations or communities may require additional outreach?
-- We can find areas that the coverage is relatively low.
SELECT
    l.region,
    COUNT(*) AS delivery_records,
    COUNT(DISTINCT f.event_group_id) AS event_groups,
    SUM(f.people_reached) AS people_reached,
    ROUND(
        1.0 * SUM(f.people_reached)
        / NULLIF(COUNT(*), 0),
        1
    )
FROM dbo.gold_fact_event_delivery AS f
INNER JOIN dbo.gold_dim_location AS l
    ON f.location_id = l.location_id
GROUP BY
    l.region
ORDER BY
    delivery_records ASC,
    people_reached ASC;
