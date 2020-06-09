
WorkDir=/home/xxq/LIN/B_3DT1_nii
# reference
MNI_T1_brain=/usr/share/fsl/data/standard/MNI152_T1_1mm_brain.nii.gz
## --------------------------

OutDir=$WorkDir/Step3_Registration_linear_shell
# mkdir $OutDir
# ---------------------------------------------------


for i  in {1..3} 
do
NUM=`printf "%03d" $i`
# NUM=001,NUM=002...

echo $NUM

#-----------------------------------------------------------
# inputs
T1_brain=${WorkDir}/S1_NC18_30_bet_shell/HCY_${NUM}_3DT1_brain.nii.gz
#-----------------------------------------------------------
# outputs
str2standard_linear=$OutDir/HCY_${NUM}_linear_str2standard.mat
str2standard_warp_name=$OutDir/HCY_${NUM}_non_linear_str2standard_warp

T1_brain_MNI=$OutDir/HCY_${NUM}_3DT1_brain_MNI.nii.gz
#-----------------------------------------------------------
## --------------------------------------------------------
## step 1: affine coregistration from T1 space to MNI space
flirt -in $T1_brain -ref $MNI_T1_brain -omat $str2standard_linear
## step2 allpy transform
flirt -in $T1_brain -ref $MNI_T1_brain -applyxfm -init $str2standard_linear -out $T1_brain_MNI   

## ----------------------------------------- 
done

