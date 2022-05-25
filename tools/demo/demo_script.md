# visualize VinVL object detection
# pretrained models at https://penzhanwu2.blob.core.windows.net/sgg/sgg_benchmark/vinvl_model_zoo/vinvl_vg_x152c4.pth
# the associated labelmap at https://penzhanwu2.blob.core.windows.net/sgg/sgg_benchmark/vinvl_model_zoo/VG-SGG-dicts-vgoi6-clipped.json
python tools/demo/demo_image.py --config_file sgg_configs/vgattr/vinvl_x152c4.yaml --img_file demo/woman_fish.jpg --save_file output/woman_fish_x152c4.obj.jpg MODEL.WEIGHT pretrained_model/vinvl_vg_x152c4.pth MODEL.ROI_HEADS.NMS_FILTER 1 MODEL.ROI_HEADS.SCORE_THRESH 0.2 TEST.IGNORE_BOX_REGRESSION False

# visualize VinVL object-attribute detection
# pretrained models at https://penzhanwu2.blob.core.windows.net/sgg/sgg_benchmark/vinvl_model_zoo/vinvl_vg_x152c4.pth
# the associated labelmap at https://penzhanwu2.blob.core.windows.net/sgg/sgg_benchmark/vinvl_model_zoo/VG-SGG-dicts-vgoi6-clipped.json
python tools/demo/demo_image.py --config_file sgg_configs/vgattr/vinvl_x152c4.yaml --img_file demo/woman_fish.jpg --save_file output/woman_fish_x152c4.attr.jpg --visualize_attr MODEL.WEIGHT pretrained_model/vinvl_vg_x152c4.pth MODEL.ROI_HEADS.NMS_FILTER 1 MODEL.ROI_HEADS.SCORE_THRESH 0.2 TEST.IGNORE_BOX_REGRESSION False

# visualize OpenImage scene graph generation by RelDN
# pretrained models at https://penzhanwu2.blob.core.windows.net/sgg/sgg_benchmark/sgg_model_zoo/sgg_oi_vrd_model_zoo/RX152FPN_reldn_oi_best.pth
python tools/demo/demo_image.py --config_file sgg_configs/vrd/R152FPN_vrd_reldn.yaml --img_file demo/1024px-Gen_Robert_E_Lee_on_Traveler_at_Gettysburg_Pa.jpg --save_file output/1024px-Gen_Robert_E_Lee_on_Traveler_at_Gettysburg_Pa.reldn_relation.jpg --visualize_relation MODEL.ROI_RELATION_HEAD.DETECTOR_PRE_CALCULATED False

# visualize Visual Genome scene graph generation by neural motif
python tools/demo/demo_image.py --config_file sgg_configs/vg_vrd/rel_danfeiX_FPN50_nm.yaml --img_file demo/1024px-Gen_Robert_E_Lee_on_Traveler_at_Gettysburg_Pa.jpg --save_file demo/1024px-Gen_Robert_E_Lee_on_Traveler_at_Gettysburg_Pa_vgnm.jpg --visualize_relation MODEL.ROI_RELATION_HEAD.DETECTOR_PRE_CALCULATED False DATASETS.LABELMAP_FILE "visualgenome/VG-SGG-dicts-danfeiX-clipped.json" DATA_DIR /home/penzhan/GitHub/maskrcnn-benchmark-1/datasets1 MODEL.ROI_RELATION_HEAD.USE_BIAS True MODEL.ROI_RELATION_HEAD.FILTER_NON_OVERLAP True MODEL.ROI_HEADS.DETECTIONS_PER_IMG 64 MODEL.ROI_RELATION_HEAD.SHARE_BOX_FEATURE_EXTRACTOR False MODEL.ROI_RELATION_HEAD.NEURAL_MOTIF.OBJ_LSTM_NUM_LAYERS 0 MODEL.ROI_RELATION_HEAD.NEURAL_MOTIF.EDGE_LSTM_NUM_LAYERS 2 TEST.IMS_PER_BATCH 2





On HMC:

python ./tools/demo/demo_image.py --config_file sgg_configs/vgattr/MM/vinvl_attr3636.yaml --img_file demo/woman_fish.jpg --save_file output/woman_fish_attr36.obj.jpg MODEL.WEIGHT data/pretrained_model/vinvl_vg_x152c4.pth 


python ./tools/demo/demo_image.py --config_file sgg_configs/vgattr/HMC/vinvl_attr1010.yaml --img_file tools/mini_tsv/img_FB/01389.png --save_file output/01389_1010.obj.jpg MODEL.WEIGHT data/pretrained_model/vinvl_vg_x152c4.pth 



python ./tools/demo/demo_image.py --config_file sgg_configs/vgattr/HMC/vinvl_attr1010.yaml --img_file tools/mini_tsv/img_FB/02584.png --save_file output/02584_1010.obj.jpg MODEL.WEIGHT data/pretrained_model/vinvl_vg_x152c4.pth 


python ./tools/demo/demo_image.py --config_file sgg_configs/vgattr/HMC/vinvl_attr1010.yaml --img_file tools/mini_tsv/img_FB/98564.png --save_file output/98564_1010.obj.jpg MODEL.WEIGHT data/pretrained_model/vinvl_vg_x152c4.pth 


python ./tools/demo/demo_image.py --config_file sgg_configs/vgattr/HMC/vinvl_attr1010.yaml --img_file tools/mini_tsv/img_FB/98567.png --save_file output/98567_1010.obj.jpg MODEL.WEIGHT data/pretrained_model/vinvl_vg_x152c4.pth 



python ./tools/demo/demo_image.py --config_file sgg_configs/vgattr/HMC/vinvl_attr1010.yaml --img_file tools/mini_tsv/img_FB/04175.png --save_file output/04175_1010.obj.jpg MODEL.WEIGHT data/pretrained_model/vinvl_vg_x152c4.pth 


python ./tools/demo/demo_image.py --config_file sgg_configs/vgattr/HMC/vinvl_attr1010.yaml --img_file tools/mini_tsv/img_FB/02793.png --save_file output/02793_1010.obj.jpg MODEL.WEIGHT data/pretrained_model/vinvl_vg_x152c4.pth 