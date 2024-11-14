USE jsp_poll_project;

INSERT INTO poll 
(question, start_date, end_date)
VALUES
('Style you prefer', '2024-04-24', '2028-02-28'),
('Sutoh Mitsuru And Naruse Yoshihiro played Eccentric Games in 2003 T-SQUARE vs CASIOPEA and it is super cool',
'2002-02-20', '2028-02-28'),
('19th Century style code block and snippet is on the track',
'1970-07-17', '1980-08-18');

UPDATE poll
SET
is_active = 0
WHERE
end_date < current_date;

SELECT * FROM jsp_poll_project.poll_item ;
DESC jsp_poll_project.poll_item ;

INSERT INTO jsp_poll_project.poll_item 
(poll_id, item_id, item_name)
VALUES
(2, 1, 'Fingerstyle'),
(2, 2, 'Slap'),
(2, 3, 'Percussive'),
(2, 4, 'Chording'),
(2, 5, 'Tapping'),
(3, 1, 'T-Square maniac loves Sutoh Mitsuru'),
(3, 2, 'I''d rather prefer Sakurai style bass'),
(3, 3, '8 string synth bass is super cool'),
(3, 4, 'After all, I want to play on the stage like them'),
(4, 1, 'Paper tape'),
(4, 2, 'Manual Handwriting Calculator');
