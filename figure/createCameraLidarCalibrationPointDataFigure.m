function gui = createCameraLidarCalibrationPointDataFigure(app)
    gui = struct();

    % Open a window and add some menus
    gui.handle = figure( ...
        'Name', 'PointData', ...
        'NumberTitle', 'off', ...
        'MenuBar', 'none', ...
        'ToolBar', 'none', ...
        'HandleVisibility', 'off', ...
        'Visible', 'off');

    gui.handle.SizeChangedFcn = @onSizeChanged;
    gui.mTableLidarPointsColumnWidthRatio = [0.3 0.3 0.3];

    % create an lidar points table to this figure
    gui.mTableLidarPoints = uitable(...
                                'Parent', gui.handle, ...
                                'Data', {}, ...
                                'Units', 'Normalized', ...
                                'Position', [0 0 1 1]);
    % gui.mTableImagePoints.RowName = [];
    gui.mTableLidarPoints.ColumnName = {'X', 'Y', 'Z'};
    gui.mTableLidarPoints.ColumnFormat = {[], [], []};

    function onSizeChanged(src, callbackdata)
        gui.mTableLidarPoints.Units = 'pixels';
        figureCurrentWidth = gui.mTableLidarPoints.Position(3);
        gui.mTableLidarPoints.Units = 'Normalized';
        gui.mTableLidarPoints.ColumnWidth = {...
                                            figureCurrentWidth * gui.mTableLidarPointsColumnWidthRatio(1) ...
                                            figureCurrentWidth * gui.mTableLidarPointsColumnWidthRatio(2) ...
                                            figureCurrentWidth * gui.mTableLidarPointsColumnWidthRatio(3)};
    end % onSizeChanged
end