﻿using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace demo.Migrations
{
    /// <inheritdoc />
    public partial class lab2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "GameLevels",
                columns: new[] { "LevelId", "Description", "title" },
                values: new object[,]
                {
                    { 1, null, "Cấp độ 1" },
                    { 2, null, "Cấp độ 2" },
                    { 3, null, "Cấp độ 3" }
                });

            migrationBuilder.InsertData(
                table: "Questions",
                columns: new[] { "QuestionID", "Answer", "ContentQuestion", "LevelID", "Option1", "Option2", "Option3", "Option4" },
                values: new object[,]
                {
                    { 1, "Đáp án 1", "Câu hỏi 1", 1, "Đáp án 1", "Đáp án 2", "Đáp án 3", "Đáp án 4" },
                    { 2, "Đáp án 2", "Câu hỏi 2", 2, "Đáp án 1", "Đáp án 2", "Đáp án 3", "Đáp án 4" }
                });

            migrationBuilder.InsertData(
                table: "Regions",
                columns: new[] { "RegionID", "Name" },
                values: new object[,]
                {
                    { 1, "Đồng bằng sông Hồng" },
                    { 2, "Đồng bằng sông Cửu Long" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "GameLevels",
                keyColumn: "LevelId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "GameLevels",
                keyColumn: "LevelId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "GameLevels",
                keyColumn: "LevelId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Questions",
                keyColumn: "QuestionID",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Questions",
                keyColumn: "QuestionID",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Regions",
                keyColumn: "RegionID",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Regions",
                keyColumn: "RegionID",
                keyValue: 2);
        }
    }
}
