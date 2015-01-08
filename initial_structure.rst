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
    |   |-- gtsdf (General Time Series Data Format) (own module?)
    |   |-- signal (signal processing, see also scipy.signal)
    |   |   |-- rainflow counting
    |   |-- tools (engineering tools)
    |   |   |-- euler geomotry, rad2deg, rpm2rads, deg_mean, deg_std
    |   |   |-- fatigue
    |   |-- wind (very general, not bound to HAWC2 formats)
    |   |-- wrappers (larger components should move into their own module)
    |   |   |-- hawc2
    |   |   |-- becas
    |   |   |-- hawcstab2


HAWC2
-----

- ascii2bin: Converting HAWC2 ascii files into the HAWC2 binary format
- hawc2io: Script for reading and writing Hawc2 result files
- cmp_test_cases: script to compare release test load cases
- dlc: scripts for generating htc files from highlevel dlc input
- IO scripts for HAWC2 input/output files: htc, Aerodynamic, structure, at-time, shear, .sel
- run HAWC2 cases on Torque/PBS cluster
