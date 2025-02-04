## Training
### Raw

mkdir -p ./24-Jan-2023/
#
CUDA_VISIBLE_DEVICES=0,1 python run.py \
        --do_train \
        --do_eval \
        --model_type gpt2 \
        --model_name_or_path microsoft/CodeGPT-small-java-adaptedGPT2 \
        --train_filename ../data/fine_tune_data/gptdata/buggy_methods_train.txt,../data/fine_tune_data/gptdata/fixed_methods_train.txt \
        --dev_filename ../data/fine_tune_data/gptdata/buggy_methods_valid.txt,../data/fine_tune_data/gptdata/fixed_methods_valid.txt \
        --test_filename ../data/fine_tune_data/gptdata/buggy_methods_test.txt,../data/fine_tune_data/gptdata/fixed_methods_test.txt \
        --output_dir ./24-Jan-2023/ \
        --max_source_length 400 \
        --max_target_length 400 \
        --beam_size 5 \
        --train_batch_size 2 \
        --eval_batch_size 2 \
        --learning_rate 5e-5 \
        --num_train_epochs 30 \
        2>&1 | tee ./24-Jan-2023/train.log

# ## Testing

 CUDA_VISIBLE_DEVICES=0,1 python run.py \
         --do_test \
         --model_type gpt2 \
         --load_model_path ./24-Jan-2023/checkpoint-last/pytorch_model.bin \
         --model_name_or_path microsoft/CodeGPT-small-java-adaptedGPT2 \
         --test_filename ../data/fine_tune_data/gptdata/buggy_methods_test.txt,../data/fine_tune_data/gptdata/fixed_methods_test.txt \
         --output_dir ./24-Jan-2023/ \
         --max_source_length 400 \
         --max_target_length 400 \
         --beam_size 5 \
         --train_batch_size 2 \
         --eval_batch_size 2 \
         --learning_rate 5e-5 \
         --num_train_epochs 30 \
         2>&1 | tee ./24-Jan-2023/eval-23-Aug.log
