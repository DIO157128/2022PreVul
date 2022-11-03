import os
if __name__ =="__main__":
    # os.system("python codet5_main.py --load_model_from_checkpoint --output_dir=./saved_models_source --model_name=model.bin --do_train --train_data_file=../data/fine_tune_data/bugfix_train.csv --eval_data_file=../data/fine_tune_data/bugfix_val.csv --epochs 75 --encoder_block_size 512 --decoder_block_size 256 --train_batch_size 8 --eval_batch_size 8 --learning_rate 2e-5 --max_grad_norm 1.0 --n_gpu 1 --evaluate_during_training --seed 123456  2>&1 | tee train_source.log")
    os.system("python codet5_main.py --output_dir=./saved_models_source --model_name=model.bin --do_test --test_data_file=../data/fine_tune_data/cve_fixes_test.csv --encoder_block_size 512 --decoder_block_size 256 --eval_batch_size 1 --n_gpu 1")
    # os.system("python codet5_main.py --output_dir=./saved_models_target --model_name=model.bin --do_trans --train_data_file=../data/fine_tune_data/cve_fixes_train.csv --eval_data_file=../data/fine_tune_data/cve_fixes_val.csv --epochs 75 --encoder_block_size 512 --decoder_block_size 256 --train_batch_size 8 --eval_batch_size 8 --learning_rate 2e-5 --max_grad_norm 1.0 --n_gpu 1 --evaluate_during_training --seed 123456  2>&1 | tee train_target.log")
    # os.system("python codet5_main.py --output_dir=./saved_models_target --model_name=model.bin --do_test --test_data_file=../data/fine_tune_data/cve_fixes_test.csv --encoder_block_size 512 --decoder_block_size 256 --eval_batch_size 1 --n_gpu 1")