#!/usr/bin/env python

import os
import shutil
import sys
from pycisTopic.lda_models import run_cgs_models_mallet
import pickle

n_topics = int(sys.argv[1])

# Configure MALLET memory
os.environ['MALLET_MEMORY'] = '128G'

# Paths
mallet_path = "/faststorage/project/projectsInBioinformatics/share/Mallet-202108/bin/mallet"
tmp_path =  f"/faststorage/project/projectsInBioinformatics/workspaces/johan/cistopic_outs/mallet_models/tmp_{n_topics}"
save_path = f"/faststorage/project/projectsInBioinformatics/workspaces/johan/cistopic_outs/mallet_models/model_{n_topics}"

# Create directories if they don't exist and make sure they are empty
shutil.rmtree(tmp_path, ignore_errors=True)
os.makedirs(tmp_path, exist_ok=True)

shutil.rmtree(save_path, ignore_errors=True)
os.makedirs(save_path, exist_ok=True)

# Load cisTopic object
with open("/faststorage/project/projectsInBioinformatics/workspaces/johan/cistopic_outs/cleaned_cistopic_obj.pkl", "rb") as f:
    cistopic_obj = pickle.load(f)

# Run model
model = run_cgs_models_mallet(
    cistopic_obj,
    n_topics=[n_topics],
    n_cpu=8,
    n_iter=500,
    random_state=555,
    alpha=50,
    alpha_by_topic=True,
    eta=0.1,
    eta_by_topic=False,
    tmp_path=tmp_path,
    save_path=save_path,
    mallet_path=mallet_path,
)

# Save result
with open(f"{save_path}/model_{n_topics}.pkl", "wb") as f:
    pickle.dump(model, f)

