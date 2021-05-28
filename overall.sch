<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xbr" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="POST" />
        <signal name="RST" />
        <signal name="DBG" />
        <signal name="XLXN_5" />
        <signal name="SLOW" />
        <signal name="XLXN_12" />
        <signal name="CLK" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <port polarity="Input" name="POST" />
        <port polarity="BiDirectional" name="RST" />
        <port polarity="Output" name="DBG" />
        <port polarity="Output" name="SLOW" />
        <port polarity="Input" name="CLK" />
        <blockdef name="post_proc">
            <timestamp>2021-5-27T23:27:25</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="delayer">
            <timestamp>2021-5-12T15:21:55</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="divider_d1">
            <timestamp>2021-5-14T15:56:48</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="divider_d2">
            <timestamp>2021-5-14T15:53:35</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="clk_doubler">
            <timestamp>2021-5-14T15:27:6</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="post_proc" name="XLXI_1">
            <blockpin signalname="POST" name="POST" />
            <blockpin signalname="XLXN_12" name="CLK" />
            <blockpin signalname="XLXN_5" name="to_slow" />
            <blockpin signalname="DBG" name="DBG" />
            <blockpin signalname="RST" name="RST" />
        </block>
        <block symbolname="divider_d1" name="XLXI_6">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_19" name="CLK_D" />
        </block>
        <block symbolname="delayer" name="XLXI_3">
            <blockpin signalname="XLXN_5" name="to_slow" />
            <blockpin signalname="XLXN_20" name="CLK" />
            <blockpin signalname="SLOW" name="de_slow" />
        </block>
        <block symbolname="clk_doubler" name="XLXI_9">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_12" name="CLK_D" />
        </block>
        <block symbolname="divider_d2" name="XLXI_8">
            <blockpin signalname="XLXN_19" name="CLK" />
            <blockpin signalname="XLXN_20" name="CLK_D" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1504" y="1504" name="XLXI_1" orien="R0">
        </instance>
        <branch name="POST">
            <wire x2="1504" y1="1344" y2="1344" x1="1488" />
        </branch>
        <branch name="RST">
            <wire x2="1904" y1="1472" y2="1472" x1="1888" />
        </branch>
        <branch name="DBG">
            <wire x2="1904" y1="1408" y2="1408" x1="1888" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="2064" y1="1344" y2="1344" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1904" y="1472" name="RST" orien="R0" />
        <iomarker fontsize="28" x="1904" y="1408" name="DBG" orien="R0" />
        <instance x="2064" y="1440" name="XLXI_3" orien="R0">
        </instance>
        <branch name="SLOW">
            <wire x2="2464" y1="1344" y2="1344" x1="2448" />
        </branch>
        <iomarker fontsize="28" x="2464" y="1344" name="SLOW" orien="R0" />
        <iomarker fontsize="28" x="1488" y="1344" name="POST" orien="R180" />
        <branch name="XLXN_12">
            <wire x2="1488" y1="1472" y2="1472" x1="1472" />
            <wire x2="1504" y1="1472" y2="1472" x1="1488" />
        </branch>
        <branch name="CLK">
            <wire x2="1072" y1="1472" y2="1472" x1="1056" />
            <wire x2="1072" y1="1472" y2="1488" x1="1072" />
            <wire x2="1072" y1="1488" y2="1632" x1="1072" />
            <wire x2="1504" y1="1632" y2="1632" x1="1072" />
            <wire x2="1088" y1="1472" y2="1472" x1="1072" />
        </branch>
        <iomarker fontsize="28" x="1056" y="1472" name="CLK" orien="R180" />
        <instance x="1504" y="1664" name="XLXI_6" orien="R0">
        </instance>
        <instance x="2064" y="1664" name="XLXI_8" orien="R0">
        </instance>
        <branch name="XLXN_19">
            <wire x2="2064" y1="1632" y2="1632" x1="1888" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="2048" y1="1408" y2="1504" x1="2048" />
            <wire x2="2464" y1="1504" y2="1504" x1="2048" />
            <wire x2="2464" y1="1504" y2="1632" x1="2464" />
            <wire x2="2064" y1="1408" y2="1408" x1="2048" />
            <wire x2="2464" y1="1632" y2="1632" x1="2448" />
        </branch>
        <instance x="1088" y="1504" name="XLXI_9" orien="R0">
        </instance>
    </sheet>
</drawing>