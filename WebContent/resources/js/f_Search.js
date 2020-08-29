$(function()
{
	// 지역
    $('#area').click(function()
    {
        $('#workAreaList').toggle(0, function()
        {
            $('#skillList').hide();
            $('#careerList').hide();
        });
    });
    
    // 전문기술
    $('#skill').click(function()
    {
    	$('#skillList').toggle(0, function()
    	{
    		$('#workAreaList').hide();
    		$('#careerList').hide();
    	});
    });
    
    // 경력
    $('#careerDate').click(function()
	{
    	$('#careerList').toggle(0, function()
		{
    		$('#skillList').hide();
    		$('#workAreaList').hide();
		});
	});
});