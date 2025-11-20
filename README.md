# HIDE: Hybrid Intelligent Detection for Real-Time Network Intrusion Detection

## Overview

This repository contains the IEEE Access format implementation of "HIDE: A Hybrid Machine Learning Methodology for Real-Time Network Intrusion Detection" - an innovative approach that combines unsupervised and supervised machine learning techniques for high-performance network intrusion detection.

## Key Features

- **Hybrid Architecture**: Two-stage processing with intelligent routing
- **Real-time Performance**: Sub-millisecond latency per flow
- **Line-rate Compliance**: Tested up to 10 Gbps throughput
- **Uncertainty-based Fusion**: Novel approach to combine detector outputs
- **Hardware Co-optimization**: SIMD optimizations for maximum performance

## System Architecture

HIDE consists of five main components:

1. **Fast Preprocessing Module (FPM)**: Hardware-optimized feature extraction
2. **Hybrid Anomaly Detector (HAD)**: Combines Isolation Forest and Variational Autoencoder
3. **Intelligent Confidence Router (ICR)**: Adaptive multi-criteria optimization
4. **Optimized Supervised Classifier (OSC)**: XGBoost + Temporal CNN ensemble
5. **Decision and Response Module (DRM)**: Final classification and response

## Performance Results

- **Accuracy**: 98.7% ± 0.3% (95% CI)
- **False Positive Rate**: 1.2% ± 0.2%
- **Latency**: 0.73ms ± 0.08ms per flow
- **Throughput**: 23,000+ flows/second
- **Improvement over SOTA**: +3.2% accuracy, -61% latency

## Files Description

- `access.tex`: Main IEEE Access format paper
- `references.bib`: Bibliography with real academic references
- `ieeeaccess.cls`: IEEE Access LaTeX class file
- `fig1.png`: System architecture diagram
- Additional image files: Various diagrams and figures

## Datasets Used

- **CIC-IDS2017**: 2.8M network flow records
- **CSE-CIC-IDS2018**: 16.2M network flow records  
- **UNSW-NB15**: 2.5M network flow records

## Compilation Instructions

To compile the IEEE Access format paper:

```bash
pdflatex access.tex
bibtex access
pdflatex access.tex
pdflatex access.tex
```

## Key Innovations

### 1. Uncertainty-Based Fusion Function
```
Score_final = w₁·Score_IFA + w₂·Score_AVF + w₃·|Score_IFA - Score_AVF|
```

### 2. Intelligent Confidence Router (ICR)
- Dynamic threshold adaptation
- Multi-criteria optimization
- Stochastic gradient descent with momentum

### 3. Hardware Co-optimizations
- SIMD vectorization (4.2x speedup)
- Cache-optimized data structures
- Lock-free parallel processing
- NUMA-aware memory allocation

## Experimental Validation

- **50 independent runs** per configuration
- **95% confidence intervals** for all metrics
- **Statistical significance testing** with Bonferroni correction
- **Line-rate validation** on real hardware

## Future Work

- Distributed HIDE for >25 Gbps networks
- AutoML integration for continuous optimization
- Real-world deployment validation
- Extension to IoT and edge computing scenarios

## Citation

If you use this work in your research, please cite:

```bibtex
@article{freire2025hide,
  title={HIDE: A Hybrid Machine Learning Methodology for Real-Time Network Intrusion Detection},
  author={Freire, Fabricio Rodrigues},
  journal={IEEE Access},
  year={2025},
  publisher={IEEE}
}
```

## Contact

**Author**: Fabricio Rodrigues Freire  
**Institution**: Instituto de Ciências Exatas e Tecnologia, Universidade Paulista (UNIP)  
**Email**: fabricio.freire@docente.unip.br

## License

This work is licensed under the IEEE Access Open Access License. See the IEEE Access website for details.

## Acknowledgments

This work was supported in part by the Brazilian National Council for Scientific and Technological Development (CNPq). We thank the High-Performance Computing Center at Universidade Paulista for computational resources.
