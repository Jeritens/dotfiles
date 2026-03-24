local M = {}

local chessPuzzles = {
    {
        title = "Default Board",
        fen = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
        solution = "e4 best by test",
        rating = "",
    },
}

local matePattern = {
    { name = "Back Rank Mate", fen = "R5k1/5ppp/8/8/8/8/8/4K3" },
    { name = "Anastasia's Mate", fen = "8/4Nppk/8/7R/8/8/8/6K1" },
    { name = "Anderssen's Mate", fen = "6kR/6P1/5K2/8/8/8/8/8" },
    { name = "Arabian Mate", fen = "7k/7R/5N2/8/8/8/8/6K1" },
    { name = "Blackburne's Mate", fen = "5rk1/7B/8/4B1N1/8/8/8/4K3" },
    { name = "Boden's Mate", fen = "2kr4/3n4/B7/4B3/8/8/8/4K3" },
    { name = "Damiano's Mate", fen = "5qk1/6pQ/6P1/8/8/8/8/4K3" },
    { name = "Knight Corner Mate", fen = "7k/5N1p/8/6R1/8/8/8/6K1" },
    { name = "Cozio's Mate", fen = "8/8/8/8/6p1/5qk1/7Q/6K1" },
    { name = "Damiano Bishop Mate", fen = "6k1/6Q1/5B2/8/8/8/8/4K3" },
    { name = "David and Goliath Mate", fen = "8/8/6qp/6pk/6P1/5P2/5B2/4K3" },
    { name = "Double Bishop Mate", fen = "7k/7p/8/3B4/3B4/8/8/4K3" },
    { name = "Dovetail Mate", fen = "6q1/6kp/5Q2/6P1/8/8/8/4K3" },
    { name = "Epaulette Mate", fen = "3rkr2/8/4Q3/8/8/8/8/4K3" },
    { name = "Greco's Mate", fen = "7k/6p1/8/7Q/2B5/8/8/4K3" },
    { name = "Hook Mate", fen = "4R3/4kp2/5N2/4P3/8/8/8/4K3" },
    { name = "Corner Mate", fen = "6kR/5p2/5B2/8/8/8/8/4K3" },
    { name = "Legal's Mate", fen = "3q1b2/4kB2/3p4/3NN3/8/8/8/4K3" },
    { name = "Lolli's Mate", fen = "6k1/5pQ1/5Pp1/8/8/8/8/6K1" },
    { name = "Max Lange's Mate", fen = "6Q1/5Bpk/7p/8/8/8/8/4K3" },
    { name = "Minor Piece Mate", fen = "6k1/6pp/6N1/3B4/8/8/8/4K3" },
    { name = "Morphy's Mate", fen = "7k/7p/8/4B1R1/8/8/8/4K3" },
    { name = "Reti's Mate", fen = "1nbB4/1pk5/2p5/8/8/8/8/3RK3" },
    { name = "Opera Mate", fen = "3Rk3/5p2/5B2/8/8/8/8/4K3" },
    { name = "Pillsbury's Mate", fen = "5rk1/5p1p/8/8/8/8/1B6/4K1R1" },
    { name = "Queen and Pawn Mate", fen = "6k1/6Q1/5P2/8/8/8/8/4K3" },
    { name = "Smothered Mate", fen = "6rk/5Npp/8/8/8/8/8/4K3" },
    { name = "Suffocation Mate", fen = "5rk1/4Np1p/5B2/8/8/8/8/4K3" },
    { name = "Swallow-Tail Mate", fen = "3r1r2/4k3/4Q3/3B4/8/8/8/4K3" },
    { name = "Corridor's Mate", fen = "7k/8/8/6R1/7Q/8/8/7K" },
    { name = "Mighty Queen Mate", fen = "5Q1k/7p/8/8/8/8/8/4K3" },
}

local WHITE = "#ffffff"
local BLACK = "#000000"
-- local LIGHT_SQUARE = "#f0d9b5"
local DARK_SQUARE = "#b58863"
local LIGHT_SQUARE = "#D3C6AA"

local unicode_pieces = {
    r = "󰡛",
    n = "󰡘",
    b = "󰡜",
    q = "󰡚",
    k = "󰡗",
    p = "󰡙",
    -- r = "♖",
    -- n = "♘",
    -- b = "♗",
    -- q = "♕",
    -- k = "♔",
    -- p = "♙",
}

--- @param fen string
local function parseFEN(fen)
    if fen == "" then
        return ""
    end
    local fenParsed = {}
    for part in fen:gmatch("%S+") do
        table.insert(fenParsed, part)
    end
    return fenParsed[1]
end

--- @param fen string
local function fenToSnackBoard(fen)
    local board = {}
    local squareNum = 0
    local rowNum = 0
    for char in fen:gmatch(".") do
        if tonumber(char) then
            for _ = 1, tonumber(char) do
                table.insert(
                    board,
                    { " ", hl = ((rowNum + squareNum) % 2 == 0) and "LightSquareWhite" or "DarkSquareWhite" }
                )
                squareNum = squareNum + 1
            end
        end
        if char:match("/") then
            rowNum = rowNum + 1
            table.insert(board, { "\n" })
        end
        if char:match("%a") then
            local highlight = ""
            if char:match("%u") then
                highlight = ((rowNum + squareNum) % 2 == 0) and "LightSquareWhite" or "DarkSquareWhite"
            else
                highlight = ((rowNum + squareNum) % 2 == 0) and "LightSquareBlack" or "DarkSquareBlack"
            end
            table.insert(board, { unicode_pieces[char:lower()], hl = highlight })
            squareNum = squareNum + 1
        end
    end
    return board
end

local function getChessPuzzle()
    local cmd =
    "curl -s https://lichess.org/api/puzzle/next | jq -r .game.pgn | node ~/dev/chess-cli-fen/convertPGNtoFEN.js"
    -- local cmd =
    -- 	"curl https://lichess.org/api/puzzle/next | jq '. | {name: .puzzle.id, rating: .puzzle.rating, pgn: .game.pgn}'"

    local handle = io.popen(cmd)
    if not handle then
        return ""
    end

    local fen = handle:read("*a")
    handle:close()
    local pFen = parseFEN(fen)

    local result = fenToSnackBoard(pFen)
    table.insert(result, 1, { fen .. "\n" })
    return result
end

local function getCheckMate()
    math.randomseed(os.time())
    local randomMate = matePattern[math.random(#matePattern)]
    local pFen = parseFEN(randomMate.fen)
    local result = fenToSnackBoard(pFen)
    table.insert(result, 1, { randomMate.name .. "\n" })
    return result
end

function M.getChessForSnackDash()
    vim.cmd("highlight LightSquareWhite guibg=" .. LIGHT_SQUARE .. " guifg=" .. WHITE)
    vim.cmd("highlight LightSquareBlack guibg=" .. LIGHT_SQUARE .. " guifg=" .. BLACK)
    vim.cmd("highlight DarkSquareWhite guibg=" .. DARK_SQUARE .. " guifg=" .. WHITE)
    vim.cmd("highlight DarkSquareBlack guibg=" .. DARK_SQUARE .. " guifg=" .. BLACK)
    -- math.randomseed(os.time())
    -- local isCheckmate = math.random(0,1)
    -- if isCheckmate == 1 then
    --     return getCheckMate()
    -- else
    --  return getChessPuzzle()
    -- end
    return getCheckMate()
end

return M
