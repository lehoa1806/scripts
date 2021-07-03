SELECT
  t1.pid AS pid,
  t1.user_name AS user_name,
  ( CASE WHEN t2.pid THEN 'Actually running' ELSE t1.status END ) AS status,
  t1.starttime AS starttime,
  t1.duration AS duration,
  t2.query AS query_id,
  REPLACE ( REPLACE ( REPLACE ( TRIM ( t1.query ), '\n', ' ' ), '\t', ' ' ), '  ', ' ' ) AS querytxt,
  t3.queue AS queue,
  t3.slot_count AS slot_count,
  t3.state AS state,
  t2.suspended AS suspended,
  t2.concurrency_scaling_status AS concurrency_scaling_status,
  TRIM ( t1.query ) AS query 
FROM
  stv_recents AS t1
  LEFT JOIN stv_inflight AS t2 USING ( pid )
  LEFT JOIN wlm_query_state_vw AS t3 ON t3.query = t2.query 
WHERE
  t1.status != 'Done'
ORDER BY
  status, query_id;




-- Other version
SELECT
  stv_recents.pid AS pid,
  stv_recents.user_name AS user_name,
  ( CASE WHEN stv_inflight.pid THEN 'Actually running' ELSE stv_recents.status END ) AS status,
  stv_recents.starttime AS starttime,
  stv_recents.duration AS duration,
  stv_inflight.query AS query_id,
  REPLACE ( REPLACE ( REPLACE ( TRIM ( stv_recents.query ), '\n', ' ' ), '\t', ' ' ), '  ', ' ' ) AS querytxt,
  stv_inflight.suspended AS suspended,
  stv_inflight.concurrency_scaling_status AS concurrency_scaling_status,
  TRIM ( stv_recents.query ) AS query 
FROM
  stv_recents
  LEFT JOIN stv_inflight USING ( pid ) 
WHERE
  stv_recents.status != 'Done'
ORDER BY
  status, query_id;
