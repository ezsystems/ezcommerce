UPDATE
    ezcontentclass_attribute
SET
    data_type_string = 'ezfloat'
WHERE
        contentclass_id = (
        SELECT
            id
        FROM
            ezcontentclass
        WHERE
                identifier = 'ses_product'
    )
  AND identifier = 'ses_unit_price';

UPDATE
    ezcontentobject_attribute
SET
    data_float = CAST(
            replace(data_text, ',', '.') AS DECIMAL(65, 2)
        ),
    data_type_string = 'ezfloat'
WHERE
        contentclassattribute_id = (
        SELECT
            id
        FROM
            ezcontentclass_attribute
        WHERE
                contentclass_id = (
                SELECT
                    id
                FROM
                    ezcontentclass
                WHERE
                        identifier = 'ses_product'
            )
          AND identifier = 'ses_unit_price'
    );

