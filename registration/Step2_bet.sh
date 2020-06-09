
WorkDir=/home/xxq/LIN
# shell scripts
input_path=${WorkDir}/B_3DT1_nii/S1_NC18_30
out_path=${WorkDir}/B_3DT1_nii/S1_NC18_30_bet

mkdir $out_path

cd $input_path
for i in *
do
echo $i
echo ${i:0:12}

bet ${input_path}/$i ${out_path}/${i:0:12}_brain -m -f 0.2 -R
done


