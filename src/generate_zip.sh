#!/usr/bin/env bash

project_name='poo2_unit2_templates_poo_v2021_2'
source_code='
        p1.h p1.cpp
        p2.h p2.cpp
        p3.h p3.cpp
        p4.h p4.cpp
        p5.h p5.cpp
        p6.h p6.cpp
        p7.h p7.cpp
        p8.h p8.cpp
  '
rm -f ${project_name}.zip
zip -r -S ${project_name} ${source_code}