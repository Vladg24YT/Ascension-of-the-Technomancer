//////////////////////////////////////////////////////////////////////////////////////////////
// Name: GregTech.zs
// Author: Lazerous
//////////////////////////////////////////////////////////////////////////////////////////////

print("Initializing 'GregTech.zs'...");

##  Val Definitions
val flour = <ore:foodFlour>;
val dough = <gregtech:gt.metaitem.02:32559>;
val rodIron = <gregtech:gt.metaitem.01:23032>;
val ringIron = <gregtech:gt.metaitem.01:28032>;
val gtHammer = <gregtech:gt.metatool.01:12>;

## Val Definitions
val circuitAssemblerHV = <gregtech:gt.blockmachines:1182>;
val robotArmHV = <gregtech:gt.metaitem.01:32652>;
val conveyorModuleHV = <gregtech:gt.metaitem.01:32632>;
val emitterHV = <gregtech:gt.metaitem.01:32682>;
val machineHullHV  = <gregtech:gt.blockmachines:13>;
val cableGoldHV  = <gregtech:gt.blockmachines:1426>;
val advancedCircuit = <IC2:itemPartCircuitAdv>;

## Prevent JABBA unification exploits
#  Iron/PigIron/WroughtIron
<ore:ingotAnyIron>.remove(<gregtech:gt.metaitem.01:11304>);             // Wrought Iron Ingot
<ore:ingotAnyIron>.remove(<gregtech:gt.metaitem.01:11307>);             // Pig Iron Ingot
<ore:ingotDoubleAnyIron>.remove(<gregtech:gt.metaitem.01:13304>);       // Wrought Iron Ingot (Double)
<ore:ingotDoubleAnyIron>.remove(<gregtech:gt.metaitem.01:13307>);       // Pig Iron Ingot (Double)
<ore:ingotTripleAnyIron>.remove(<gregtech:gt.metaitem.01:14304>);       // Wrought Iron Ingot (Triple)
<ore:ingotTripleAnyIron>.remove(<gregtech:gt.metaitem.01:14307>);       // Pig Iron Ingot (Triple)
<ore:ingotQuadrupleAnyIron>.remove(<gregtech:gt.metaitem.01:15304>);    // Wrought Iron Ingot (Quadruple)
<ore:ingotQuadrupleAnyIron>.remove(<gregtech:gt.metaitem.01:15307>);    // Pig Iron Ingot (Quadruple)
<ore:ingotQuintupleAnyIron>.remove(<gregtech:gt.metaitem.01:16304>);    // Wrought Iron Ingot (Quintuple)
<ore:ingotQuintupleAnyIron>.remove(<gregtech:gt.metaitem.01:16307>);    // Pig Iron Ingot (Quintuple)
<ore:oreAnyIron>.remove(<gregtech:gt.blockores:307>);                   // Pig Iron Ore
<ore:dustAnyIron>.remove(<gregtech:gt.metaitem.01:2304>);               // Wrought Iron Dust
<ore:dustAnyIron>.remove(<gregtech:gt.metaitem.01:2307>);               // Pig Iron Dust
<ore:dustPureAnyIron>.remove(<gregtech:gt.metaitem.01:4307>);           // Pig Iron Dust (Pure)
<ore:dustPureAnyIron>.remove(<gregtech:gt.metaitem.01:3307>);           // Pig Iron Dust (Inpure)
<ore:dustSmallAnyIron>.remove(<gregtech:gt.metaitem.01:1304>);          // Wrought Iron Dust (Small)
<ore:dustSmallAnyIron>.remove(<gregtech:gt.metaitem.01:1307>);          // Pig Iron Dust (Small)
<ore:dustTinyAnyIron>.remove(<gregtech:gt.metaitem.01:304>);            // Wrought Iron Dust (Tiny)
<ore:dustTinyAnyIron>.remove(<gregtech:gt.metaitem.01:307>);            // Pig Iron Dust (Tiny)
<ore:nuggetAnyIron>.remove(<gregtech:gt.metaitem.01:9304>);             // Wrought Iron Nugget
<ore:nuggetAnyIron>.remove(<gregtech:gt.metaitem.01:9307>);             // Pig Iron Nugget
#  Copper/AnnealedCopper    
<ore:ingotAnyCopper>.remove(<gregtech:gt.metaitem.01:11345>);           // Annealed Copper Ingot
<ore:ingotDoubleAnyCopper>.remove(<gregtech:gt.metaitem.01:13345>);     // Annealed Copper Ingot (Double)
<ore:ingotTripleAnyCopper>.remove(<gregtech:gt.metaitem.01:14345>);     // Annealed Copper Ingot (Triple)
<ore:ingotQuadrupleAnyCopper>.remove(<gregtech:gt.metaitem.01:15345>);  // Annealed Copper Ingot (Quadruple)
<ore:ingotQuintupleAnyCopper>.remove(<gregtech:gt.metaitem.01:16345>);  // Annealed Copper Ingot (Quintuple)
<ore:dustAnyCopper>.remove(<gregtech:gt.metaitem.01:2345>);             // Annealed Copper Dust
<ore:dustSmallAnyCopper>.remove(<gregtech:gt.metaitem.01:1345>);        // Annealed Copper Dust (Small)
<ore:dustTinyAnyCopper>.remove(<gregtech:gt.metaitem.01:345>);          // Annealed Copper Dust (Tiny)
<ore:nuggetAnyCopper>.remove(<gregtech:gt.metaitem.01:9345>);           // Annealed Copper Nugget

## Fix wrought iron ingot -> conversion
recipes.addShapeless(<gregtech:gt.metaitem.01:9304> * 9, [<gregtech:gt.metaitem.01:11304>]);

##  Iron Rod ~ Remove toolless crafting
recipes.removeShaped(rodIron * 4, [[<ore:ingotIron>, null, null],[<ore:ingotIron>, null, null], [null, null, null]]);

##  Dough
recipes.remove(dough);
recipes.addShapeless(dough, [flour, <minecraft:water_bucket>.giveBack(<minecraft:bucket>)]);
recipes.addShapeless(dough, [flour, <minecraft:potion>.giveBack(<minecraft:glass_bottle>)]);
recipes.addShapeless(dough, [flour, <harvestcraft:freshwaterItem>]);

##  Chainmail made from iron (not steel)
recipes.removeShaped(<minecraft:chainmail_helmet>);
recipes.removeShaped(<minecraft:chainmail_chestplate>);
recipes.removeShaped(<minecraft:chainmail_leggings>);
recipes.removeShaped(<minecraft:chainmail_boots>);
recipes.addShaped(<minecraft:chainmail_helmet>, [[ringIron, ringIron, ringIron], [ringIron, gtHammer, ringIron], [null, null, null]]);
recipes.addShaped(<minecraft:chainmail_chestplate>, [[ringIron, gtHammer, ringIron], [ringIron, ringIron, ringIron], [ringIron, ringIron, ringIron]]);
recipes.addShaped(<minecraft:chainmail_leggings>, [[ringIron, ringIron, ringIron], [ringIron, gtHammer, ringIron], [ringIron, null, ringIron]]);
recipes.addShaped(<minecraft:chainmail_boots>, [[ringIron, null, ringIron], [ringIron, gtHammer, ringIron], [null, null, null]]);

## HV Circuit Assembler Fix
# This machine requires a data stick which is overpriced at 160 EU in GT 5.28, making this machine impossible to make
# Fixed in GT5.29, but it crashes the nether.
#
# Now using 5.09.30 pre-release, nether is fine and recipe no longer needed
# recipes.addShaped(circuitAssemblerHV, [[robotArmHV, advancedCircuit, emitterHV], [conveyorModuleHV, machineHullHV, conveyorModuleHV], [cableGoldHV, advancedCircuit, cableGoldHV]]);

print("Initialized 'GregTech.zs'");
