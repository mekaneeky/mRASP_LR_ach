#!/usr/bin/env bash
PROJECT_ROOT=.
num_cpus=7
subword_bpe_merge_ops=32000

# preprocess fine-tune train data
fairseq-preprocess \
        --source-lang ach --target-lang en \
        --srcdict ${PROJECT_ROOT}/vocab.bpe.${subword_bpe_merge_ops} \
        --tgtdict ${PROJECT_ROOT}/vocab.bpe.${subword_bpe_merge_ops} \
        --trainpref /home/ali/Documents/repos/datasets/salt/v7-dataset/v7.0/supervised/en-ach/merged_data/ach2en/train \
        --validpref /home/ali/Documents/repos/datasets/salt/v7-dataset/v7.0/supervised/en-ach/test_data/ach2en/dev \
        --destdir /home/ali/Documents/repos/datasets/salt/v7-dataset/v7.0/supervised/en-ach/fine-tune/ach2en \
        --workers ${num_cpus}

# preprocess fine-tune test data
# fairseq-preprocess \
#         --source-lang en --target-lang de \
#         --srcdict ${PROJECT_ROOT}/experiments/toy/vocab/vocab.bpe.${subword_bpe_merge_ops} \
#         --tgtdict ${PROJECT_ROOT}/experiments/toy/vocab/vocab.bpe.${subword_bpe_merge_ops} \
#         --testpref ${PROJECT_ROOT}/experiments/toy/test_data/en2de/dev \
#         --destdir ${PROJECT_ROOT}/experiments/toy/data/test/en2de/wmt14_head100/bin \
#         --workers ${num_cpus}

#mkdir -p ${PROJECT_ROOT}/experiments/toy/data/test/en2de/wmt14_head100/raw

#cp ${PROJECT_ROOT}/experiments/toy/data/raw/test/en2de/* ${PROJECT_ROOT}/experiments/toy/data/test/en2de/wmt14_head100/raw/
