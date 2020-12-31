#!/bin/bash

service mysql restart
service nginx restart
service grafana-server restart




HOSTNAME="localhost" 
PORT="3306"
USERNAME="grafana"
PASSWORD="grafana"

#mysql user for service grafana
mysql -e"GRANT ALL PRIVILEGES ON *.* TO \"${USERNAME}\"@\"%\" IDENTIFIED BY \"${PASSWORD}\";"
mysql -e"flush privileges;"

#database name
DBNAME="factory"

#time to save data
TIME_TO_SAVE_DATA="6 HOUR"

#table info---network traffic
TABLE_NAME_NETWORK="network"
ELEMENT_NAME_NETWORK_INPUT="input"
ELEMENT_NAME_NETWORK_OUTPUT="output"

#table info--- switch CPU loading
TABLE_NAME_SWITCH="switch"
ELEMENT_NAME_SWITCH_CPU="CPUloading"

#table info --- network logs
TABLE_NAME_NETWORKS_LOGS="network_logs"
ELEMENT_NAME_NETWORKS_LOGS_TYPE="type"
ELEMENT_NAME_NETWORKS_LOGS_DETAIL="detail"

warning_log_1="workshop 1 centralized control center switch 3A cpuloading 5s: threshold=10, value=10 CPU Loading High is 5S!"
info_log_2="workshop 1 line 2 zone 3 switch A5 port 8 link down"
info_log_3="workshop 1 line 2 zone 3 switch A5 port 8 link up"
info_log_4="workshop 4 line 1 control cabinet 3 port 2 link down"
info_log_5="workshop 4 line 1 control cabinet 3 port 2 link up"
warning_log_6="workshop 1 centralized control center switch 3A traffic overloaded"
info_log_7="workshop 3 line 3 switch 5 port 3 link down"
info_log_8="workshop 3 line 3 switch 5 port 3 link up"

#table info --- network security logs
TABLE_NAME_NETWORKS_SECURITY_LOGS="network_security_logs"
ELEMENT_NAME_NETWORKS_SECURITY_LOGS_TYPE="type"
ELEMENT_NAME_NETWORKS_SECURITY_LOGS_DETAIL="detail"

security_info_log_1="SDC2A5698 DPI pattern metadata updated"
security_info_log_2="SDC1A2349 DPI pattern metadata updated"
security_info_log_3="SDC825973 DPI pattern metadata updated"
security_info_log_4="SDC8B4383 DPI pattern metadata updated"
security_info_log_5="SDC825973 DPI pattern metadata updated"
security_notice_log_6="workshop 1 centralized control center IPS352 User(admin) timeout, force logout"
security_warning_log_7="workshop 3 zone 5 IPS245 UDP Flood over Threshold"
security_warning_log_8="workshop 3 zone 5 IPS436 UDP port Scan"

#table info --- line_i
PRODUCT_LINE_TOTAL=4


for ((i=0; i<$PRODUCT_LINE_TOTAL; i++))
do
    array_table_name[$i]=line_$[$i + 1]
    array_value_power[$i]=1035
    array_value_water[$i]=100
    array_value_gas[$i]=300
done
array_value_worker=(20 70 50 100)

ELEMENT_NAME_PRODUCT_LINE_POP="percent_of_pass"            
ELEMENT_NAME_PRODUCT_LINE_TAR="time_action_rate"           
ELEMENT_NAME_PRODUCT_LINE_PAR="performance_action_rate"    
ELEMENT_NAME_PRODUCT_LINE_OEE="OEE"  
ELEMENT_NAME_PRODUCT_LINE_WORKER="worker" 
ELEMENT_NAME_PRODUCT_LINE_POWER="power"       
ELEMENT_NAME_PRODUCT_LINE_WATER="water"  
ELEMENT_NAME_PRODUCT_LINE_GAS="gas"

#table info --- energy
TABLE_NAME_ENERGY="energy"
#power water gas --- total

#table info --- material pull
DATA_TOTAL=20

TABLE_NAME_MATERIAL_PULL="material_pull"

ELEMENT_NAME_MATERIAL_PULL_ID="ID"
ELEMENT_NAME_MATERIAL_PULL_PRODUCTION_LINE="production_line"
ELEMENT_NAME_MATERIAL_PULL_DAY="day"
ELEMENT_NAME_MATERIAL_PULL_SCHEDULE="schedule"
ELEMENT_NAME_MATERIAL_PULL_MATERIAL="material"

array_array_material_schedule=("dayshift" "nightshift")
array_array_material_material=(DH7131400 DH7131480 HDZ557400 DH7131400 DH7140200 HDS08T040 HDZ13T731 HDM75P040 DH7131400 DH7131400 DH7140200 HDS08T040 HDZ13T731 HDM75P040 
HDM16T399 HDZ557400 HDM16T331 DH7140200 HDS08T040 DH7131400)

#table_info --- worker order list
TABLE_NAME_WORKERORDER_LIST="workorder_list"

ELEMENT_NAME_WORKERORDER_LIST_ORDER="orderID"
ELEMENT_NAME_WORKERORDER_LIST_WORKORDER="workorderID"
ELEMENT_NAME_WORKERORDER_LIST_QUATITY="quantity"
ELEMENT_NAME_WORKERORDER_LIST_FINISH="finish"

array_order_list=("DH7131480073" "HDZ557400652" "HDM16T33874" "DH7140200847" "HDS08T040006" "HDS08T040842" "HDZ13T731753" "HDM75P040393" "DH7131480073" "HDZ557400652")
array_workorder_list=("H201287432" "B201109341" "H201133870" "H201149500" "H201200974" "B201184374" "B201287422" "H201092841" "H201287438" "B201287432")
array_workerorder_list_quantity=(10000 5000 860 2400 1500 2400 870 650 9700 6500)
array_workerorder_list_finish=(3724 2408 76 320 100 233 253 420 3280 2346)

#table info --- quality classify
TABLE_NAME_QUALITY_CLASSIFY="quality_classify"

array_quality_classify_element_name=("ANDON54312" "ANDON98518" "material10" "quality19" "device23" "device12" "ANDON23212" "quality21")

#table info --- order finish progress
TABLE_NAME_ORDER_FINISH_PROGRESS="order_finish_progress"

array_order_finish_progress_element_name=("DH7131480073" "HDZ557400652" "HDM16T33874" "DH7140200847" "HDS08T040006" "HDS08T040842" "HDZ13T731753" "HDM75P040393" "HDZ557408643" "DH7131895038")
array_order_finish_progress_element_value=(10 23 69 33 57 15 12 0 53 12)

#table info --- precent of pass 
TABLE_NAME_PRECENT_OF_PASS="percent_of_pass"
array_percent_of_pass_element_name=("DH7131400" "DH7131480" "HDZ557400" "HDM16T331" "DH7140200" "HDS08T040" "HDZ13T730" "HDM75P040" "HDM16T399" "HDZ557486")

#table info --- yield of year
TABLE_NAME_YIELD_OF_YEAR="yield_of_year"
ELEMENT_NAME_YIELD_OF_YEAR_VALUE="yield"

array_yield_of_year_month=(January February March Apirl May June July August September October November December)
array_yield_of_year_value=(3221 1234 2123 2874 5526 8634 9873 8764 9624 7253 9145 9244)


#create database
create_db_sql="CREATE DATABASE IF NOT EXISTS ${DBNAME};"
mysql -e"${create_db_sql}"

#select database
select_db_sql="use ${DBNAME};"


#create table network
create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_NETWORK} ($ELEMENT_NAME_NETWORK_INPUT INT, $ELEMENT_NAME_NETWORK_OUTPUT INT, 
time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

#create tabble swtich
create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_SWITCH} ($ELEMENT_NAME_SWITCH_CPU INT, time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

#create table network logs
delete_table_sql="${select_db_sql} drop table ${TABLE_NAME_NETWORKS_LOGS};"
mysql -e"${delete_table_sql}"

create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_NETWORKS_LOGS} (ID INT, $ELEMENT_NAME_NETWORKS_LOGS_TYPE VARCHAR(100), 
$ELEMENT_NAME_NETWORKS_LOGS_DETAIL VARCHAR(1000), time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

i=1
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_LOGS} (ID, $ELEMENT_NAME_NETWORKS_LOGS_TYPE, $ELEMENT_NAME_NETWORKS_LOGS_DETAIL) values 
($i, \"Information\", \"$warning_log_1\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_LOGS} (ID, $ELEMENT_NAME_NETWORKS_LOGS_TYPE, $ELEMENT_NAME_NETWORKS_LOGS_DETAIL) values 
($i, \"Information\", \"$info_log_2\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_LOGS} (ID, $ELEMENT_NAME_NETWORKS_LOGS_TYPE, $ELEMENT_NAME_NETWORKS_LOGS_DETAIL) values 
($i, \"Information\", \"$info_log_3\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_LOGS} (ID, $ELEMENT_NAME_NETWORKS_LOGS_TYPE, $ELEMENT_NAME_NETWORKS_LOGS_DETAIL) values 
($i, \"Information\", \"$info_log_4\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_LOGS} (ID, $ELEMENT_NAME_NETWORKS_LOGS_TYPE, $ELEMENT_NAME_NETWORKS_LOGS_DETAIL) values 
($i, \"Information\", \"$info_log_5\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_LOGS} (ID, $ELEMENT_NAME_NETWORKS_LOGS_TYPE, $ELEMENT_NAME_NETWORKS_LOGS_DETAIL) values 
($i, \"Notice\", \"$warning_log_6\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_LOGS} (ID, $ELEMENT_NAME_NETWORKS_LOGS_TYPE, $ELEMENT_NAME_NETWORKS_LOGS_DETAIL) values 
($i, \"Warning\", \"$info_log_7\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_LOGS} (ID, $ELEMENT_NAME_NETWORKS_LOGS_TYPE, $ELEMENT_NAME_NETWORKS_LOGS_DETAIL) values 
($i, \"Warning\", \"$info_log_8\");"
mysql -e"${insert_sql}"

NETWORK_LOGS_COUNT=$i
 
#create table network sercurity log
delete_table_sql="${select_db_sql} drop table ${TABLE_NAME_NETWORKS_SECURITY_LOGS};"
mysql -e"${delete_table_sql}"

create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_NETWORKS_SECURITY_LOGS} (ID INT, $ELEMENT_NAME_NETWORKS_SECURITY_LOGS_TYPE 
VARCHAR(100), $ELEMENT_NAME_NETWORKS_SECURITY_LOGS_DETAIL VARCHAR(1000), time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

i=1
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_SECURITY_LOGS} (ID, $ELEMENT_NAME_NETWORKS_SECURITY_LOGS_TYPE, 
$ELEMENT_NAME_NETWORKS_SECURITY_LOGS_DETAIL) values ($i, \"Information\", \"$security_info_log_1\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_SECURITY_LOGS} (ID, $ELEMENT_NAME_NETWORKS_SECURITY_LOGS_TYPE, 
$ELEMENT_NAME_NETWORKS_SECURITY_LOGS_DETAIL) values ($i, \"Information\", \"$security_info_log_2\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_SECURITY_LOGS} (ID, $ELEMENT_NAME_NETWORKS_SECURITY_LOGS_TYPE, 
$ELEMENT_NAME_NETWORKS_SECURITY_LOGS_DETAIL) values ($i, \"Information\", \"$security_info_log_3\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_SECURITY_LOGS} (ID, $ELEMENT_NAME_NETWORKS_SECURITY_LOGS_TYPE, 
$ELEMENT_NAME_NETWORKS_SECURITY_LOGS_DETAIL) values ($i, \"Information\", \"$security_info_log_4\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_SECURITY_LOGS} (ID, $ELEMENT_NAME_NETWORKS_SECURITY_LOGS_TYPE, 
$ELEMENT_NAME_NETWORKS_SECURITY_LOGS_DETAIL) values ($i, \"Information\", \"$security_info_log_5\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_SECURITY_LOGS} (ID, $ELEMENT_NAME_NETWORKS_SECURITY_LOGS_TYPE, 
$ELEMENT_NAME_NETWORKS_SECURITY_LOGS_DETAIL) values ($i, \"Notice\", \"$security_notice_log_6\");"
mysql ${DBNAME} -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_SECURITY_LOGS} (ID, $ELEMENT_NAME_NETWORKS_SECURITY_LOGS_TYPE, 
$ELEMENT_NAME_NETWORKS_SECURITY_LOGS_DETAIL) values ($i, \"Warning\", \"$security_warning_log_7\");"
mysql -e"${insert_sql}"

i=$[$i+1]
insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORKS_SECURITY_LOGS} (ID, $ELEMENT_NAME_NETWORKS_SECURITY_LOGS_TYPE, 
$ELEMENT_NAME_NETWORKS_SECURITY_LOGS_DETAIL) values ($i, \"Warning\", \"$security_warning_log_8\");"
mysql -e"${insert_sql}"

#create table [line_i] [energy]
for ((i=0; i <${PRODUCT_LINE_TOTAL}; i++))
do 
    create_table_sql="${select_db_sql} create table if not exists ${array_table_name[$i]} ($ELEMENT_NAME_PRODUCT_LINE_POP INT, 
    $ELEMENT_NAME_PRODUCT_LINE_TAR INT, $ELEMENT_NAME_PRODUCT_LINE_PAR INT, $ELEMENT_NAME_PRODUCT_LINE_OEE INT, $ELEMENT_NAME_PRODUCT_LINE_POWER INT, 
    $ELEMENT_NAME_PRODUCT_LINE_WATER INT, $ELEMENT_NAME_PRODUCT_LINE_GAS INT, $ELEMENT_NAME_PRODUCT_LINE_WORKER INT, 
    time timestamp not null default current_timestamp on update current_timestamp);"
    mysql -e"${create_table_sql}"
done

create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_ENERGY} ($ELEMENT_NAME_PRODUCT_LINE_POWER INT, 
$ELEMENT_NAME_PRODUCT_LINE_WATER INT, $ELEMENT_NAME_PRODUCT_LINE_GAS INT, time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

#create table --- material pull
delete_table_sql="${select_db_sql} drop table ${TABLE_NAME_MATERIAL_PULL};"
mysql -e"${delete_table_sql}"

create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_MATERIAL_PULL} ($ELEMENT_NAME_MATERIAL_PULL_ID INT, 
$ELEMENT_NAME_MATERIAL_PULL_PRODUCTION_LINE INT, $ELEMENT_NAME_MATERIAL_PULL_DAY DATE, $ELEMENT_NAME_MATERIAL_PULL_SCHEDULE VARCHAR(100), 
$ELEMENT_NAME_MATERIAL_PULL_MATERIAL VARCHAR(100), time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

for ((i=1; i <= $DATA_TOTAL; i++))
do
    material_pull_line=$[$RANDOM%4 + 1]
    material_pull_day=$[$RANDOM%3]
    material_pull_day="DATE_SUB(NOW(), INTERVAL $material_pull_day DAY)"
    material_pull_schedule=${array_array_material_schedule[$[$RANDOM%2]]}

    insert_sql="${select_db_sql} insert into  ${TABLE_NAME_MATERIAL_PULL} ($ELEMENT_NAME_MATERIAL_PULL_ID, $ELEMENT_NAME_MATERIAL_PULL_PRODUCTION_LINE, 
    $ELEMENT_NAME_MATERIAL_PULL_DAY, $ELEMENT_NAME_MATERIAL_PULL_SCHEDULE, $ELEMENT_NAME_MATERIAL_PULL_MATERIAL) values ($i, $material_pull_line, 
    $material_pull_day, \"$material_pull_schedule\", \"${array_array_material_material[$[$i-1]]}\");"
    mysql -e"${insert_sql}"
done

#create table --- workerorder_list
drop_table_sql="${select_db_sql} drop table ${TABLE_NAME_WORKERORDER_LIST}"
mysql -e"${drop_table_sql}"

create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_WORKERORDER_LIST} (ID INT, $ELEMENT_NAME_WORKERORDER_LIST_ORDER VARCHAR(100), 
$ELEMENT_NAME_WORKERORDER_LIST_WORKORDER VARCHAR(100), $ELEMENT_NAME_WORKERORDER_LIST_QUATITY INT, $ELEMENT_NAME_WORKERORDER_LIST_FINISH INT, 
time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

for ((i=0; i < ${#array_order_list[@]}; i++))
do
    #insert data
    insert_sql="${select_db_sql} insert into ${TABLE_NAME_WORKERORDER_LIST} (ID, $ELEMENT_NAME_WORKERORDER_LIST_ORDER, 
    $ELEMENT_NAME_WORKERORDER_LIST_WORKORDER, $ELEMENT_NAME_WORKERORDER_LIST_QUATITY, $ELEMENT_NAME_WORKERORDER_LIST_FINISH) values 
    ($[$i+1], \"${array_order_list[$i]}\", \"${array_workorder_list[$i]}\", ${array_workerorder_list_quantity[$i]}, ${array_workerorder_list_finish[$i]});"
    mysql -e"${insert_sql}"
    
done

#create table --- quality classify
array_quality_classify_element_string=""
quality_classify_element_string=""
for name in ${array_quality_classify_element_name[@]}
do 
    array_quality_classify_element_string="${array_quality_classify_element_string} $name INT,"
    quality_classify_element_string="${quality_classify_element_string} $name, "
done

create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_QUALITY_CLASSIFY} ($array_quality_classify_element_string time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

#create table --- order finish progress
element_string=""
for name in ${array_order_finish_progress_element_name[@]}
do 
    element_string="${element_string} $name INT,"
done

create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_ORDER_FINISH_PROGRESS} ($element_string time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

order_finish_progress_element_string=""
for name in ${array_order_finish_progress_element_name[@]}
do 
    order_finish_progress_element_string="${order_finish_progress_element_string} $name, "
done

#create table --- precent of pass 
percent_of_pass_element_string=""
for name in ${array_percent_of_pass_element_name[@]}
do 
    percent_of_pass_element_string="${percent_of_pass_element_string} $name INT,"
done

create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_PRECENT_OF_PASS} ($percent_of_pass_element_string time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

percent_of_pass_element_string=""
for name in ${array_percent_of_pass_element_name[@]}
do 
    percent_of_pass_element_string="${percent_of_pass_element_string} $name, "
done


#create table --- yield of year 
delete_table_sql="${select_db_sql} drop table ${TABLE_NAME_YIELD_OF_YEAR};"
mysql -e"${delete_table_sql}"

yield_of_year_month_str=""
for ((i=0; i < ${#array_yield_of_year_month[@]}; i++))
do
yield_of_year_month_str="${yield_of_year_month_str} ${array_yield_of_year_month[$i]} INT, "
done

create_table_sql="${select_db_sql} create table if not exists ${TABLE_NAME_YIELD_OF_YEAR} (ID INT, $yield_of_year_month_str time timestamp not null default current_timestamp on update current_timestamp);"
mysql -e"${create_table_sql}"

yield_of_year_month_str=""
yield_of_year_value_str=""
for ((i=0; i < ${#array_yield_of_year_month[@]}; i++))
do
yield_of_year_month_str="${yield_of_year_month_str} ${array_yield_of_year_month[$i]}, "
yield_of_year_value_str="${yield_of_year_value_str} ${array_yield_of_year_value[$i]}, "
done

insert_sql="${select_db_sql} insert into ${TABLE_NAME_YIELD_OF_YEAR} ($yield_of_year_month_str ID) values ($yield_of_year_value_str 1);"
mysql -e"${insert_sql}"    

while :
do

    #update data one hour once
    for ((i=1; i <= $DATA_TOTAL; i++))
    do
        #update data --- material pull 
        material_pull_day=$[$RANDOM%3]
        material_pull_day="DATE_SUB(NOW(), INTERVAL $material_pull_day DAY)"
        update_sql="${select_db_sql} update ${TABLE_NAME_MATERIAL_PULL} set ${ELEMENT_NAME_MATERIAL_PULL_DAY}=$material_pull_day where ID=$i;"
        mysql -e"${update_sql}"
    done

    for ((i=0; i < ${#array_order_list[@]}; i++))
    do
        #update data --- order list
        array_workerorder_list_finish[$i]=$[$[${array_workerorder_list_finish[$i]} + $RANDOM%3] % ${array_workerorder_list_quantity[$i]}]
        update_sql="${select_db_sql} update ${TABLE_NAME_WORKERORDER_LIST} set $ELEMENT_NAME_WORKERORDER_LIST_FINISH=${array_workerorder_list_finish[$i]} where ID=$[$i+1];"
        mysql -e"${update_sql}"
    done

    #insert data to quality classify
    value=""
    for ((i=0; i < ${#array_quality_classify_element_name[@]}; i++))
    do
        value="${value} $[$RANDOM % 50],"
    done

    insert_sql="${select_db_sql} insert into  ${TABLE_NAME_QUALITY_CLASSIFY} ($quality_classify_element_string time) values ($value NOW());"
    mysql -e"${insert_sql}"

    #insert data to order finish progress
    value=""
    for ((i=0; i < ${#array_order_finish_progress_element_value[@]}; i++))
    do
        array_order_finish_progress_element_value[${i}]=$[(${array_order_finish_progress_element_value[${i}]} + $RANDOM % 3)%100]
        value="${value} ${array_order_finish_progress_element_value[${i}]},"
    done

    insert_sql="${select_db_sql} insert into  ${TABLE_NAME_ORDER_FINISH_PROGRESS} ($order_finish_progress_element_string time) values ($value NOW());"
    mysql -e"${insert_sql}"

    #insert data to percent of pass 
    value=""
    for ((i=0; i < ${#array_percent_of_pass_element_name[@]}; i++))
    do
        value_single_element=$[($RANDOM)%30 + 70]
        value="${value} ${value_single_element},"
    done
    insert_sql="${select_db_sql} insert into  ${TABLE_NAME_PRECENT_OF_PASS} ($percent_of_pass_element_string time) values ($value NOW());"
    mysql -e"${insert_sql}"

    #update data --- yield of year 
    update_sql="${select_db_sql} update ${TABLE_NAME_YIELD_OF_YEAR} set time=NOW() where ID=1;"
    mysql -e"${update_sql}"

    #update data one munite once
    for ((minute=1;minute<60;minute++)) 
    do
        #insert data to table network
        value_input=$[($RANDOM % 81)+20]
        value_output=$[($RANDOM % 81)+20]
        insert_sql="${select_db_sql} insert into  ${TABLE_NAME_NETWORK} ($ELEMENT_NAME_NETWORK_INPUT, $ELEMENT_NAME_NETWORK_OUTPUT) values 
        ($value_input, $value_output);"
        mysql -e"${insert_sql}"

        value=$[($RANDOM % 28)+3]
        insert_sql="${select_db_sql} insert into  ${TABLE_NAME_SWITCH} ($ELEMENT_NAME_SWITCH_CPU) values ($value);"
        mysql -e"${insert_sql}"

        #update network logs
        for ((index=1; index <= ${NETWORK_LOGS_COUNT}; index++))
        do
            update_sql="${select_db_sql} update ${TABLE_NAME_NETWORKS_LOGS} set time=NOW() where ID=$index;"
            mysql -e"${update_sql}"

            update_sql="${select_db_sql} update ${TABLE_NAME_NETWORKS_SECURITY_LOGS} set time=NOW() where ID=$index;"
            mysql -e"${update_sql}"
        done

        array_value_power[$PRODUCT_LINE_TOTAL]=0
        array_value_water[$PRODUCT_LINE_TOTAL]=0
        array_value_gas[$PRODUCT_LINE_TOTAL]=0

        for ((i=0; i <$PRODUCT_LINE_TOTAL; i++))
        do
            #percent of pass 85-99
            value_pop=$[($RANDOM % 14)+85]
            #time action rate 50-80
            value_tar=$[($RANDOM % 30)+50]
            #performance action rate 70-90
            value_par=$[($RANDOM % 21)+70]
            #OEE = value_pop * value_tar * value_par
            value_OEE=$[$value_pop * $value_tar * $value_par]
            #power add 0~7
            array_value_power[$i]=$[${array_value_power[$i]} + ($RANDOM % 8)]
            array_value_power[$PRODUCT_LINE_TOTAL]=$[${array_value_power[$i]} + ${array_value_power[$PRODUCT_LINE_TOTAL]}]
            #water add 0~7
            array_value_water[$i]=$[${array_value_water[$i]} + ($RANDOM % 8)]
            array_value_water[$PRODUCT_LINE_TOTAL]=$[${array_value_water[$i]} + ${array_value_water[$PRODUCT_LINE_TOTAL]}]    
            #gas add 0~7
            array_value_gas[$i]=$[${array_value_gas[$i]} + ($RANDOM % 8)]
            array_value_gas[$PRODUCT_LINE_TOTAL]=$[${array_value_gas[$i]} + ${array_value_gas[$PRODUCT_LINE_TOTAL]}]

            #insert data
            insert_sql="${select_db_sql} insert into ${array_table_name[$i]} ($ELEMENT_NAME_PRODUCT_LINE_POP, $ELEMENT_NAME_PRODUCT_LINE_TAR, 
            $ELEMENT_NAME_PRODUCT_LINE_PAR, $ELEMENT_NAME_PRODUCT_LINE_OEE, $ELEMENT_NAME_PRODUCT_LINE_POWER, $ELEMENT_NAME_PRODUCT_LINE_WATER, 
            $ELEMENT_NAME_PRODUCT_LINE_GAS, $ELEMENT_NAME_PRODUCT_LINE_WORKER) values ($value_pop, $value_tar, $value_par, $value_OEE, 
            ${array_value_power[$i]}, ${array_value_water[$i]}, ${array_value_gas[$i]}, ${array_value_worker[$i]});"
            mysql -e"${insert_sql}"

        done

        #insert data to energy
        insert_sql="${select_db_sql} insert into ${TABLE_NAME_ENERGY} ($ELEMENT_NAME_PRODUCT_LINE_POWER, $ELEMENT_NAME_PRODUCT_LINE_WATER, 
        $ELEMENT_NAME_PRODUCT_LINE_GAS) values (${array_value_power[$PRODUCT_LINE_TOTAL]}, ${array_value_water[$PRODUCT_LINE_TOTAL]}, 
        ${array_value_gas[$PRODUCT_LINE_TOTAL]});"
        mysql -e"${insert_sql}"

        sleep 55s

    done

    #delete data from network
    delete_sql="${select_db_sql} delete from $TABLE_NAME_NETWORK where time < (CURRENT_TIMESTAMP()+INTERVAL - ${TIME_TO_SAVE_DATA});"
    mysql -e"${delete_sql}"

    #delete data from switch
    delete_sql="${select_db_sql} delete from $TABLE_NAME_SWITCH where time < (CURRENT_TIMESTAMP()+INTERVAL -  ${TIME_TO_SAVE_DATA});"
    mysql -e"${delete_sql}"

    #delete data from line_i
    for ((i=0; i <$PRODUCT_LINE_TOTAL; i++))
    do
        delete_sql="${select_db_sql} delete from ${array_table_name[$i]} where time < (CURRENT_TIMESTAMP()+INTERVAL - ${TIME_TO_SAVE_DATA});"
        mysql -e"${delete_sql}"
    done

    #delete data from energy
    delete_sql="${select_db_sql} delete from ${TABLE_NAME_ENERGY} where time < (CURRENT_TIMESTAMP()+INTERVAL - ${TIME_TO_SAVE_DATA});"
    mysql -e"${delete_sql}"

    #delete data from quality classify
    delete_sql="${select_db_sql} delete from ${TABLE_NAME_QUALITY_CLASSIFY} where time < (CURRENT_TIMESTAMP()+INTERVAL - ${TIME_TO_SAVE_DATA});"
    mysql -e"${delete_sql}"

    #delete data from order finish progress
    delete_sql="${select_db_sql} delete from $TABLE_NAME_ORDER_FINISH_PROGRESS where time < (CURRENT_TIMESTAMP()+INTERVAL - ${TIME_TO_SAVE_DATA});"
    mysql -e"${delete_sql}"

    #delete data from percent of pass
    delete_sql="${select_db_sql} delete from $TABLE_NAME_PRECENT_OF_PASS where time < (CURRENT_TIMESTAMP()+INTERVAL - ${TIME_TO_SAVE_DATA});"
    mysql -e"${delete_sql}"


done



