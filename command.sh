#! /bin/sh

# The following command calls use this program
#  https://github.com/ntustison/Utilities/blob/master/src/RigidTransformImage.cxx
# which is not in ANTs so we comment them out.

# RigidTransformImage 2 r16slice.nii.gz r16sliceRotate15.nii.gz 15
# RigidTransformImage 2 r16slice.nii.gz r16sliceRotate7.5.nii.gz 7.5

${ANTSPATH}/antsMultivariateTemplateConstruction.sh \
       -d 2 \
       -o ${PWD}/T_ \
       -c 2 \
       -j 2 \
       -i 4 \
       -k 1 \
       -w 1 \
       -m 50x40x10x0 \
       -n 0 \
       -r 1 \
       -s CC \
       -t GR \
       -g 0.25 \
       -b 1 \
       ${PWD}/Data/r16slice.nii.gz ${PWD}/Data/r16sliceRotate15.nii.gz


# Visually inspect images using SNAP and compare with projected midpoint
# snap -g ${PWD}/Data/r16slice.nii.gz -o T_template0.nii.gz &
# snap -g ${PWD}/Data/r16sliceRotate7.5.nii.gz -o T_template0.nii.gz &
# snap -g ${PWD}/Data/r16sliceRotate15.nii.gz -o T_template0.nii.gz &

# Also, we can measure the similarity for all images with the template
# echo "MSQ( r16, template ) = "
# ${ANTSPATH}/MeasureImageSimilarity 2 0 ${PWD}/Data/r16slice.nii.gz ${PWD}/T_template0.nii.gz
# echo "MSQ( T( r16, 7.5 degrees ), template ) = "
# ${ANTSPATH}/MeasureImageSimilarity 2 0 ${PWD}/Data/r16sliceRotate7.5.nii.gz ${PWD}/T_template0.nii.gz
# echo "MSQ( T( r16, 15 degrees ), template ) = "
# ${ANTSPATH}/MeasureImageSimilarity 2 0 ${PWD}/Data/r16sliceRotate15.nii.gz ${PWD}/T_template0.nii.gz


