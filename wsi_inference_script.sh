# MonuSac
python3 'run_infer.py' \
--gpu=0 \
--nr_types=5 \
--type_info_path='type_info_inclusive_colors.json' \
--batch_size=5 \
--model_mode=fast \
--model_path='models/checkpoints/lr_10e_-4_net_epoch=50.tar' \
--nr_inference_workers=11 \
--nr_post_proc_workers=11 \
wsi \
--input_dir='/media/veracrypt1/Lymphoma_subgrouping/Projects/Apr_2022_Automated_grading_WSI_pipeline/testing/Test_wsi/wsi' \
--output_dir='/media/veracrypt1/Lymphoma_subgrouping/Projects/Apr_2022_Automated_grading_WSI_pipeline/testing/Test_wsi/output' \
--proc_mag=40 \
--cache_path='/media/veracrypt1/Lymphoma_subgrouping/Projects/Apr_2022_Automated_grading_WSI_pipeline/testing/Test_wsi/cache' \
--input_mask_dir='/media/veracrypt1/Lymphoma_subgrouping/Projects/Apr_2022_Automated_grading_WSI_pipeline/testing/Test_wsi/mask' 


 
