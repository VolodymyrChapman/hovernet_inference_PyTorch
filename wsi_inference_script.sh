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
--input_dir='testing/wsi' \
--output_dir='testing/outdata' \
--proc_mag=40 \
--cache_path='/media/volodymyr/1TB_Store_A/Lymphoma_backup/cache' \
--input_mask_dir='testing/mask' 


 
