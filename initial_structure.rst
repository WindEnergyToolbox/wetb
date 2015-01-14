Toolbox overview
================

base package: components
------------------------

- rainflow counting (generally applicable, move further upstream in to scipy?)
- fatigue_tools: Fatigue calculation, rainflow counting binned on amplitude (and mean). Based on cases, rainflow counting, and corresponding distribution of hours: calculate an equivalent load
- signal processing (sonic spikes, find time shift) (Mads)
- euler geomotry, rad2deg, rpm2rads, deg_mean, deg_std (Mads)
- DLC definitions:
    - highlevel: Script for reading highlevel code independent pre- and postprocessing input (xlsx-workbook)
- wind (might move to a separate one if it gets bigger?)
    - turbulence
        - Mann parameters estimation
    - wsp_dir2uv, wsp_dir_tilt2uvw    
- gtsdf (Mads): General Time Series Data Format. Data format for time series based on the binary hdf5. Is there a specific reason why not using pandas.timeseries and the h5 data store from pandas?
- general torque/pbs cluster tools (David)

base package: folder structure
------------------------------

For inspiration, look at https://github.com/pydata/pandas

::

    |-- doc
    |-- examples 
    |-- src
    |   |-- dlcgenerator
    |   |-- cluster
    |   |-- control
    |   |-- gtsdf (General Time Series Data Format) (own module?)
    |   |-- signal (signal processing, see also scipy.signal)
    |   |   |-- rainflow counting (1D or nD? If nD, same principle as numpy)
    |   |   |-- statistics
    |   |-- tools (engineering tools)
    |   |   |-- euler geomotry, rad2deg, rpm2rads, deg_mean, deg_std
    |   |   |-- fatigue
    |   |   |-- damping tuning
    |   |-- wind (very general, not bound to HAWC2 formats)
    |   |-- wrappers (larger components should move into their own module)
    |   |   |-- hawc2
    |   |   |-- becas
    |   |   |-- hawcstab2


Data structures and classes

::

    Case (model agnostic: HAWC2, BLADED, HawcStab2, FAST)
    |-- model input: tag representation or a pre-defined variable tree?
    |-- results
    |-- calculate statistics
    |-- rainflow counting
    |-- calculate fatigue (1Hz equivalent load)

    Cases
    |-- Inherits from the Case class
    |-- Is a collection of cases, in a DataFrame. How to set which columns (or searchable values from the Case data structure)? Note that these columns need to be user definable.
    |-- Besides model inputs, also statistics and rainflow cycles should be part of it
    |-- calculate fatigue lifetime
    |-- 


HAWC2
-----

- ascii2bin: Converting HAWC2 ascii files into the HAWC2 binary format
- hawc2io: Script for reading and writing Hawc2 result files
- cmp_test_cases: script to compare release test load cases
- dlc: scripts for generating htc files from highlevel dlc input
- IO scripts for HAWC2 input/output files: htc, Aerodynamic, structure, at-time, shear, .sel
- converters: results as Pandas DataFrame H5/CSV/FLEX/BLADED, turbulence formats: FLEX/FAST/BLADED
- run HAWC2 cases on Torque/PBS cluster
