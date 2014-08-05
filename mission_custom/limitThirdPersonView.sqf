// no loop need, if third person view is not available anyway
if (difficultyEnabled "3rdPersonView") then
{
	diag_log ("DEBUG: 3rd person is enabled, limiting to vehicles only");
	while {(true)} do
	{
		if (cameraView == "External") then
		{
			if ((vehicle player) == player) then
			{
				//diag_log ("DEBUG: switching to internal camera");
				cutText ["3rd person is only available while in a vehicle, switching to 1st person", "PLAIN DOWN"];
				player switchCamera "Internal";
			};
		};
		sleep 0.1;
	};
} else {
	diag_log ("DEBUG: 3rd person not enabled");
};