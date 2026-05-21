return {
    -- 默认配置，根据需要调整
    opts = {
        -- Server Configuration
        port_range = { min = 10000, max = 65535 },
        auto_start = false,
        log_level = "info",
        terminal_cmd = nil, -- 使用默认的 "claude" 命令

        -- Send/Focus Behavior
        focus_after_send = false,

        -- Selection Tracking
        track_selection = true,
        visual_demotion_delay_ms = 50,

        -- Terminal Configuration
        terminal = {
            split_side = "right",
            split_width_percentage = 0.30,
            provider = "auto",
            auto_close = true,
        },

        -- Diff Integration
        diff_opts = {
            layout = "vertical",
            open_in_new_tab = false,
            keep_terminal_focus = false,
        },
    },
}