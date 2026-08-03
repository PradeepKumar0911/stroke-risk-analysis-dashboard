SELECT
  gender,
  CASE 
    WHEN age <= 20 THEN '0-20'
    WHEN age <= 40 THEN '21-40'
    WHEN age <= 60 THEN '41-60'
    WHEN age <= 80 THEN '61-80'
    ELSE '81+'
  END AS Age_Group,
  
  CASE
    WHEN avg_glucose_level < 70 THEN 'Low'
    WHEN avg_glucose_level <= 90 THEN 'Normal'
    WHEN avg_glucose_level <= 125 THEN 'Prediabetic'
    ELSE 'Diabetic'
  END AS glucose_level,
  
  hypertension,
  heart_disease,
  work_type,
  smoking_status,
  COUNT(*) AS num_of_stroke
FROM
  `brain-stroke-504408.brain_stroke.stroke`
WHERE
  stroke = 1
GROUP BY 
  Age_Group,
  hypertension,
  heart_disease,
  work_type,
  smoking_status,
  gender,
  glucose_level
ORDER BY
  num_of_stroke DESC;
