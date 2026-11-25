UPDATE file_attachments AS attachment
SET file_visibility = CASE WHEN course.state = 'PUBLISHED' THEN 'PUBLIC' ELSE 'PRIVATE' END
FROM courses AS course
WHERE attachment.resource_type = 'COURSE'
  AND attachment.purpose = 'PREVIEW'
  AND attachment.resource_id = CAST(course.id AS varchar)
  AND attachment.file_id = course.preview_id
  AND attachment.file_visibility IS DISTINCT FROM
      CASE WHEN course.state = 'PUBLISHED' THEN 'PUBLIC' ELSE 'PRIVATE' END;
