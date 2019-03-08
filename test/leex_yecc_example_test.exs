defmodule LeexYeccExampleTest do
  use ExUnit.Case
  doctest LeexYeccExample

  test "converts string to charlist" do
    json = "{\"age\": 25}"
    expected = %{"age" => 25}
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end

  test "parses integers" do
    json = '{"age": 25}'
    expected = %{"age" => 25}
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end

  test "parses negative integers" do
    json = '{"age": -25}'
    expected = %{"age" => -25}
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end

  test "parses floats" do
    json = '{"temp": 18.32}'
    expected = %{"temp" => 18.32}
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end

  test "parses negative floats" do
    json = '{"temp": -18.32}'
    expected = %{"temp" => -18.32}
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end

  test "parses empty arrays" do
    json = '[]'
    expected = []
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end

  test "parses arrays" do
    json = '[1, 2, 3]'
    expected = [1, 2, 3]
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end

  test "parses empty object" do
    json = '{}'
    expected = %{}
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end

  test "parses object" do
    json = '{"key":"value"}'
    expected = %{"key" => "value"}
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end

  test "parses null value" do
    json = '{"key":null}'
    expected = %{"key" => nil}
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end

  test "parses full json" do
    json = '{"quiz": {"sport": {"q1": {"question": "Which one is correct team name in NBA?","options": ["New York Bulls","Los Angeles Kings","Golden State Warriros","Huston Rocket"],"answer": "Huston Rocket"}},"maths": {"q1": {"question": "5 + 7 = ?","options": ["10","11","12","13"],"answer": "12"},"q2": {"question": "12 - 8 = ?","options": ["1","2","3","4"],"answer": "4"}}}}'
    expected = %{
      "quiz" => %{
        "maths" => %{
          "q1" => %{
            "answer" => "12",
            "options" => ["10", "11", "12", "13"],
            "question" => "5 + 7 = ?"
          },
          "q2" => %{
            "answer" => "4",
            "options" => ["1", "2", "3", "4"],
            "question" => "12 - 8 = ?"
          }
        },
        "sport" => %{
          "q1" => %{
            "answer" => "Huston Rocket",
            "options" => ["New York Bulls", "Los Angeles Kings",
            "Golden State Warriros", "Huston Rocket"],
            "question" => "Which one is correct team name in NBA?"
          }
        }
      }
    }
    assert LeexYeccExample.parse(json) == {:ok, expected}
  end
end
