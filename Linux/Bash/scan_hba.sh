#!/bin/bash
# HBA details for RHEL systems
echo "HBA Details for `uname -n`"
echo "***********************************************"
COUNT=0
for SCSI in `ls -d /sys/class/scsi_host/host*` ;
do
[ -e ${SCSI}/modeldesc ] && COUNT=`expr ${COUNT} + 1` && echo -n "Host ${COUNT}) HBA Model Description: " && cat ${SCSI}/modeldesc
[ -e ${SCSI}/model_desc ] && COUNT=`expr ${COUNT} + 1` && echo -n "Host ${COUNT}) HBA Model Description: " && cat ${SCSI}/model_de
[ -e ${SCSI}/modelname ] && echo -n "Host ${COUNT}) Model Name (Part No.): " && cat ${SCSI}/modelname;
[ -e ${SCSI}/model_name ] && echo -n "Host ${COUNT}) Model Name (Part No.): " && cat ${SCSI}/model_name;
[ -e ${SCSI}/serialnum ] && echo -n "Host ${COUNT}) Serial Number: " && cat ${SCSI}/serialnum;
[ -e ${SCSI}/serial_num ] && echo -n "Host ${COUNT}) Serial Number: " && cat ${SCSI}/serial_num;
[ -e ${SCSI}/lpfc_drvr_version ] && echo -n "Host ${COUNT}) Driver Version: " && cat ${SCSI}/lpfc_drvr_version;
[ -e ${SCSI}/driver_version ] && echo -n "Host ${COUNT}) Driver Version: " && cat ${SCSI}/driver_version;
[ -e ${SCSI}/fwrev ] && echo -n "Host ${COUNT}) Firmware Version: " && cat ${SCSI}/fwrev;
[ -e ${SCSI}/fw_version ] && echo -n "Host ${COUNT}) Firmware Version: " && cat ${SCSI}/fw_version;
[ -e ${SCSI}/modeldesc ] && echo -n "Host ${COUNT}) Link Status: " && cat ${SCSI}/state | grep Link;
[ -e ${SCSI}/model_desc ] && echo -n "Host ${COUNT}) Link Status: " && cat ${SCSI}/state | grep Link;
done
echo "***********************************************"
echo "WWN Numbers"
echo "***********************************************"
COUNT=0
for SCSI in `ls -d /sys/class/fc_host/host*` ;
do
[ -e ${SCSI}/port_name ] && COUNT=`expr ${COUNT} + 1` && echo -n "Host ${COUNT}) WWN: " && cat ${SCSI}/port_name;
done
echo "***********************************************"
exit 0
