Prototyping (June 2025)
=======================

An evolution of prototyping.

Prototype #1
------------
The blue board is an Arduino mini pro 3v3. The red board is an FTDI 232RL USB<->UART board.

.. image:: binary/growbies_bug.jpg


The first prototype. Load cells and electronics mounted to the bottom of 10"x20" gardening tray.

.. image:: binary/proto0_0.jpg


Shown here is a spherical foot, a load cell and a mounting plate on the bottom of a gardening tray.

.. image:: binary/proto0_1.jpg



The electronics go into a 2 ounce tin for electromagnetic interference and dust/spray protection.
I am going for IP65 rating.

.. image:: binary/proto0_2.jpg

.. image:: binary/ip65.png

This is the first 3D-printed prototype. The spherical feet are to better float on soft terrain,
such as pea gravel. The wiring to the load sensors passes through the frame.

.. image:: binary/proto1_0.jpg

The electronics go inside the 2 ounce tin.

.. image:: binary/proto1_1.jpg

It was fun getting the 3D printing fill to work good with a sphere.

.. image:: binary/inside_spherical_foot.jpg

Growing lettuce.

.. image:: binary/proto1_2.jpg

Controls and a display were added. Unfortunately, the microcontroller was accidentally destroyed
before the LCD display could be made functional.

.. image:: binary/proto1_3.jpg

Prototype #2
------------
Functional OLED LCD. Simplified controls.

.. image:: binary/proto2_0.jpg

The electronics:

- Arduino mini pro 3v3
- FTDI 232RL USB <-> UART
- 4x HX711
- TP4056 power charging and protection
- 180mA battery

.. image:: binary/proto2_1.jpg


Testing
-------

Zero Offset Drift - Initial
~~~~~~~~~~~~~~~~~~~~~~~~~~~
This is some zero offset drift testing showing 120g of drift over about 11 hours. That's not
good, I am engineering to +/- 5g for the long term time range.

.. image:: binary/3.3_hx711_drift.png


The good news is that the short term time range is very sensitive with good resolution. This is
great for manual/automated watering use cases.

Also good news is that the summing of the independent scales makes the mass output more immune to
environmental vibrations when compared to a distributed bridge scale architecture.

.. image:: binary/desk_vibrations.png

Zero Offset Drift - Longer time
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
More zero offset drift testing was performed. Still at 3.3V running to modified hx711 boards for
2.7v excitation.

.. image:: binary/drift-3.3v_hx711-unloaded-long_test.png

Loaded drift testing.

.. image:: binary/drift-3.3v_hx711-loaded-long_test.png

These results were not good. The goal is for the error to not exceed +/- 5g due to drifting.

5v drift
~~~~~~~~
The load cell excitation voltage was increased from 2.7v to 4.2v. Some improvement observed in
zero offset drift for sensors 0,1 & 2. Sensor 3 is going way out of bounds.

.. image:: binary/drift-5v.png

Op-amp / ADC Check
~~~~~~~~~~~~~~~~~~

There are four parts that make up the mass sensing:

.. image:: binary/mass_sensing-4_parts.png

I wanted to see 3's voltage regulator might be causing drifting problems. I disconnected the
excitation output for sensor 3, using sensor 2's differential signal as input to sensor's 3's
op-amp/ADC.

Here are the results:

.. image:: binary/op_amp-adc-check.png

The sensor 3 data matches sensor 2 data very well. This means that sensor 3 op amp & ADC are
functioning the same as sensor 2's. It is unlikely that both sensor's op-amp/adc would be bad, so
assume that sensor 3's op-amp/adc are functioning properly. A clue indicating that the sensor 3
voltage regulator is what is drifting.

Parallel HX711 voltage regulators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Next, the voltage regulators of all hx711 boards were ran in parallel.

.. image:: binary/common_excitation_0.png

The drift of sensor 0,1 & 2 looks good. Sensor 3 does not. I suspect the voltage regulator of the
sensor 3 hx711 board is failing.

Secondary observations were made. A DC shift can be introduced through changes in the host
sampling interval, loading/unloading the scale and turning the power on/of between host samples.
All of these are likely due to heating, either in the HX711 board or in the load cell strain gages.

.. image binary/common_excitation_1.png

Next Steps & Ideas
------------------
- Replace the faulty hx711 board
- Explore the effect of adding capacitance to the parallel hx711 excitation.
- Test hx711 parallel excitation at 3.3v
- Try an external, common voltage regulator
