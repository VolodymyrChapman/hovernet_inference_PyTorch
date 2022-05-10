# MonuSac
python3 'run_infer.py' \
--gpu=0 \
--nr_types=5 \
--type_info_path='type_info_inclusive_colors.json' \
--batch_size=5 \
--model_mode=fast \
--model_path='models/checkpoints/MoNuSaC_fast.tar' \
--nr_inference_workers=11 \
--nr_post_proc_workers=11 \
tile \
--input_dir='/2TB_mount/Lymphoma_data/From_analyses/May_2022_Testing_HoVerNet_inference_PyTorch/Input_data' \
--output_dir='/2TB_mount/Lymphoma_data/From_analyses/May_2022_Testing_HoVerNet_inference_PyTorch/Output_data'
