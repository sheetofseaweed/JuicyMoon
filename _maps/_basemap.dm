//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "_mod_juicy\map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "_mod_juicy\map_files\Mining\Lavaland_novaya.dmm"
		#include "_mod_juicy\map_files\debug\runtimestation.dmm"
		#include "_mod_juicy\map_files\BoxStation\BoxStation.dmm"
		#include "_mod_juicy\map_files\IceBox\IceBoxStation.dmm"
		#include "_mod_juicy\map_files\SyndicateStation\SyndicateBoxStation.dmm"
		#include "_mod_juicy\map_files\PeaceSyndicateStation\PeaceSyndicateBoxStation.dmm"
		#include "_mod_juicy\map_files\Deltastation\DeltaStation2.dmm"
		#include "_mod_juicy\map_files\MetaStation\MetaStation.dmm"
		#include "_mod_juicy\map_files\OmegaStation\OmegaStation.dmm"
		#include "_mod_juicy\map_files\PubbyStation\PubbyStation.dmm"
		#include "_mod_juicy\map_files\LambdaStation\lambda.dmm"
		#include "_mod_juicy\map_files\SpookyStation\SpookyStation.dmm"
		#include "_mod_juicy\map_files\CogStation\CogStation.dmm"
		#include "_mod_juicy\map_files\TauStation\TauStation.dmm"
		#include "_mod_juicy\splurt_maps\map_files\Smexistation\Snaxi_Splurt.dmm"
		#include "_mod_juicy\map_files\BoxedInStation\BoxedInStation.dmm"
		#include "_mod_juicy\map_files\RatvarStation\RatvarStation.dmm"
		#include "_mod_juicy\map_files\ArmyStation\ArmyStation.dmm"
		#include "_mod_juicy\map_files\PrisonStation\PrisonStation.dmm"

		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
