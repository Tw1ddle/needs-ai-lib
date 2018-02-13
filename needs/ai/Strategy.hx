package needs.ai;

@:enum abstract Strategy(String) from String to String {
	var HIGHEST_NEEDS = "highest_needs";
	var TRUE_RANDOM = "true_random";
	var WEIGHTED_RANDOM = "weighted_random";
	var DISABLED = "disabled";
}